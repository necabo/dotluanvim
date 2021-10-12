local M = {}

local lspconfig_utils = require "necabo.plugins.lspconfig.utils"

M.setup_servers = function()
    require("lspinstall").setup()
    local servers = require("lspinstall").installed_servers()
    lspconfig_utils.setup_servers(servers)
end

require("lspinstall").post_install_hook = function()
    M.setup_servers()
    vim.cmd("bufdo e")
end

return M
