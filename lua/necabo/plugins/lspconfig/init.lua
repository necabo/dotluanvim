local lsp_status = require("lsp-status")
local lspconfig_utils = require("necabo.plugins.lspconfig.utils")
local lsp_installer = require("necabo.plugins.lsp-installer")

-- TODO: is this actually helpful or just straight up annoying?
lsp_status.register_progress()

-- TODO: add keybindings to scroll in and close floating windows

vim.o.completeopt = "menuone,noselect"

lspconfig_utils.setup_servers({ "clangd" })

lsp_installer.ensure_servers_installed({"jdtls"})
lsp_installer.setup_servers({"jdtls"})

require("necabo.plugins.lspconfig.lua")
require("necabo.plugins.lspconfig.pyright")
require("necabo.plugins.lspconfig.efm")
