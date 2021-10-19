local lsp_status = require "lsp-status"
local lspconfig_utils = require "necabo.plugins.lspconfig.utils"
local lspinstall = require "necabo.plugins.lspinstall"

-- TODO: is this actually helpful or just straight up annoying?
lsp_status.register_progress()

-- TODO: add keybindings to scroll in and close floating windows

vim.o.completeopt = "menuone,noselect"

lspconfig_utils.setup_servers({"clangd", "pylsp"})
lspinstall.setup_servers()

require "necabo.plugins.lspconfig.lua"
