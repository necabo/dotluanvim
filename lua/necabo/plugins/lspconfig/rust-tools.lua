local lspconfig_utils = require "necabo.plugins.lspconfig.utils"

local config = {
    tools = {
        crate_graph = {
            backend = "svg",
            output = "crate_graph.svg",
        },
    },
    server = {
        on_attach = lspconfig_utils.on_attach,
        capabilities = lspconfig_utils.capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
}

require("rust-tools").setup(config)
