local C = require("gitignore.cli")
local L = require("gitignore.lib")

local M = {}

function M.setup()
    L.load_ignores()
    vim.api.nvim_create_user_command("Gitignore", C.command, C.cmd_opts)
end

return M
