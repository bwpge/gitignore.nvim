local L = require("gitignore.lib")

local M = {}

local function unique(t)
    local seen = {}
    local items = {}

    for _, v in ipairs(t) do
        if not seen[v] then
            seen[v] = true
            table.insert(items, v)
        end
    end

    return items
end

function M.command(ctx)
    if ctx.fargs[1] == "build" then
        L.build(true)
        L.load_ignores()
        return
    end

    local outname = nil
    for i, v in ipairs(ctx.fargs) do
        if v == "--path" and ctx.fargs[i + 1] then
            table.remove(ctx.fargs, i)
            outname = table.remove(ctx.fargs, i)
            vim.print(ctx.fargs)
            break
        end
    end
    if not outname then
        outname = ".gitignore"
    end

    local outfile = vim.fs.abspath(outname)
    if not outfile then
        L.err("failed to resolve path '%s'", outname)
        return
    end

    local output = {}
    local names = unique(ctx.fargs)

    -- TODO: make this async
    for _, v in ipairs(names) do
        local url = string.format(
            "https://raw.githubusercontent.com/github/gitignore/refs/heads/main/%s.gitignore",
            v
        )
        local r = vim.system({ "curl", "-fsSL", url }, { text = true }):wait()
        if r.code ~= 0 then
            L.err("Gitignore error: %s", r.stderr or "")
            return
        end

        local data = r.stdout or ""
        data = data:gsub("%s+$", "")
        table.insert(output, data)
    end

    L.write_file(outfile, table.concat(output, "\n"))
    L.info("Wrote gitignore to '%s'", outfile)
    if ctx.bang then
        vim.cmd("e " .. outfile)
    end
end

local function complete_fn(_, _, _)
    -- line = line:gsub("^.- ", "")
    -- if line:find(" ") then
    --     return {}
    -- end

    return L.gitignores
end

M.cmd_opts = {
    nargs = "+",
    bang = true,
    complete = complete_fn,
    desc = "Generate a .gitignore",
}

return M
