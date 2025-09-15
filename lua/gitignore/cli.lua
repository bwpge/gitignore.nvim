local L = require("gitignore.lib")

local M = {}

function M.command(ctx)
    if #ctx.fargs > 2 then
        L.err("Gitignore command expects 1 or 2 arguments (got %d)", #ctx.fargs)
        return
    end

    if ctx.fargs[1] == "build" then
        L.build(true)
        L.load_ignores()
        return
    end

    local url = string.format(
        "https://raw.githubusercontent.com/github/gitignore/refs/heads/main/%s.gitignore",
        ctx.fargs[1]
    )

    local on_exit = function(r)
        vim.schedule(function()
            local name = ctx.fargs[2] or ".gitignore"
            local outfile = vim.fs.abspath(name)
            if not outfile then
                L.err("failed to resolve path '%s'", name)
                return
            end

            if r.code ~= 0 then
                L.err("Gitignore error: %s", r.stderr or "")
                return
            end

            local data = r.stdout or ""
            data = data:gsub("%s+$", "")
            L.write_file(outfile, data)
            L.info("Wrote gitignore to '%s'", outfile)
            if ctx.bang then
                vim.cmd("e " .. outfile)
            end
        end)
    end

    vim.system({ "curl", "-fsSL", url }, { text = true }, on_exit)
end

local function complete_fn(_, line, _)
    line = line:gsub("^.- ", "")
    if line:find(" ") then
        return {}
    end

    return L.gitignores
end

M.cmd_opts = {
    nargs = "+",
    bang = true,
    complete = complete_fn,
    desc = "Generate a language-specific .gitignore",
}

return M
