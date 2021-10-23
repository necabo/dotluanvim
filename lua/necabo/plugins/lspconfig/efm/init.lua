local lspconfig_utils = require "necabo.plugins.lspconfig.utils"

local black = require "necabo.plugins.lspconfig.efm.black"
local isort = require "necabo.plugins.lspconfig.efm.isort"
local flake8 = require "necabo.plugins.lspconfig.efm.flake8"

require("lspconfig").efm.setup {
    filetypes = { "python" },
    settings = {
        rootMarkers = { ".git/"},
        languages = {
            python = { black, isort, flake8 },
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
