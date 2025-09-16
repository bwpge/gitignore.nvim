local C = require("gitignore.cli")
local L = require("gitignore.lib")

local M = {}

local default_opts = {
    open_cmd = "split",
}

function M.setup(opts)
    opts = vim.tbl_extend("force", default_opts, opts or {})
    L.opts = opts
    L.load_ignores()
    vim.api.nvim_create_user_command("Gitignore", C.command, C.cmd_opts)
end

return M
