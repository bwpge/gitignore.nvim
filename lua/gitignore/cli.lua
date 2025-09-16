local L = require("gitignore.lib")

local M = {}

M.flags = {
    "--build",
    "-b",
    "--path",
    "-p",
}

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
    if ctx.fargs[1] == "--build" or ctx.fargs[1] == "-b" then
        L.build(true)
        L.load_ignores()
        return
    end

    local outname = nil
    for i, v in ipairs(ctx.fargs) do
        if (v == "--path" or v == "-p") and ctx.fargs[i + 1] then
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
    if L.file_exists(outfile) and not ctx.bang then
        L.err("Gitignore: output file already exists (use ! to overwrite)")
        return
    end
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

    local open_cmd = L.opts.open_cmd
    if open_cmd and #open_cmd > 0 then
        vim.cmd(open_cmd .. " " .. outfile)
    end
end

local function complete_fn(arglead, _, _)
    if arglead:find("^%-") then
        return M.flags
    end

    return L.gitignores
end

M.cmd_opts = {
    nargs = "+",
    bang = true,
    complete = complete_fn,
    desc = "Generate a .gitignore",
}

return M
