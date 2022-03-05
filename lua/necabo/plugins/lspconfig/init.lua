require("wsconfig").setup({})
local lspconfig_utils = require("necabo.plugins.lspconfig.utils")
local lsp_installer = require("necabo.plugins.lsp-installer")

-- TODO: add keybindings to scroll in and close floating windows

vim.o.completeopt = "menuone,noselect"

-- setup servers installed outside nvim
lspconfig_utils.setup_servers({ "clangd" })

lsp_installer.ensure_servers_installed({ "jdtls", "ltex" })
-- setup servers installed using nvim-lsp-installer
lsp_installer.setup_servers({ "ltex" })

require("necabo.plugins.lspconfig.lua")
require("necabo.plugins.lspconfig.pyright")
require("necabo.plugins.lspconfig.efm")
require("necabo.plugins.lspconfig.texlab")
