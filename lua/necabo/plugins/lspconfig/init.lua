local nvim_lsp = require "lspconfig"
local lsp_status = require "lsp-status"
local lspconfig_utils = require "necabo.plugins.lspconfig.utils"

-- TODO: is this actually helpful or just straight up annoying?
lsp_status.register_progress()

-- TODO: add keybindings to scroll in and close floating windows

vim.o.completeopt = "menuone,noselect"

-- jdtls needs JDTLS_HOME set
local servers = {"rust_analyzer", "jdtls", "clangd"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = lspconfig_utils.on_attach,
        capabilities = lspconfig_utils.capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

require "necabo.plugins.lspconfig.lua"
