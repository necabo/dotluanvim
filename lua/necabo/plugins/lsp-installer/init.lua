local M = {}

local lspconfig_utils = require("necabo.plugins.lspconfig.utils")
local lsp_installer = require("nvim-lsp-installer")

M.ensure_servers_installed = function(servers)
    for _, server in ipairs(servers) do
        local server_available, requested_server = lsp_installer.get_server(server)
        if not server_available then
            error('Language server "' .. server .. '" not available.')
        end
        if not requested_server:is_installed() then
            requested_server:install()
        end
    end
end

M.setup_servers = function(servers)
    for _, server in ipairs(servers) do
        local _, requested_server = lsp_installer.get_server(server)
        requested_server:on_ready(function ()
            requested_server:setup(lspconfig_utils.make_default_config())
        end)
    end
end

return M
