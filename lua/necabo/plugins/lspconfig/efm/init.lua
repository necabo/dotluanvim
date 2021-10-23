local lspconfig_utils = require "necabo.plugins.lspconfig.utils"

local black = require "necabo.plugins.lspconfig.efm.black"
local isort = require "necabo.plugins.lspconfig.efm.isort"
local flake8 = require "necabo.plugins.lspconfig.efm.flake8"

local luacheck = require "necabo.plugins.lspconfig.efm.luacheck"
local stylua = require "necabo.plugins.lspconfig.efm.stylua"

require("lspconfig").efm.setup {
    filetypes = { "python", "lua" },
    settings = {
        rootMarkers = { ".git/"},
        languages = {
            python = { black, isort, flake8 },
            lua = { luacheck, stylua },
        },
    },
    init_options = {
        documentFormatting = true,
    },
    on_attach = lspconfig_utils.on_attach,
    capabilities = lspconfig_utils.capabilities,
    flags = {
        debounce_text_changes = 150,
    },
}
