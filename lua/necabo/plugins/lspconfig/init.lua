require("wsconfig").setup({})
local lspconfig_utils = require("necabo.plugins.lspconfig.utils")
local lsp_installer = require("necabo.plugins.lsp-installer")

-- TODO: add keybindings to scroll in and close floating windows

vim.o.completeopt = "menuone,noselect"

-- texlab requires 'texlive-latexindent-meta' for latexindent to be available
lspconfig_utils.setup_servers({ "clangd", "texlab" })

lsp_installer.ensure_servers_installed({ "jdtls" })
lsp_installer.setup_servers({})

require("necabo.plugins.lspconfig.lua")
require("necabo.plugins.lspconfig.pyright")
require("necabo.plugins.lspconfig.efm")
