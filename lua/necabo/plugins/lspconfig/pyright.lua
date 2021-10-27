local lspconfig_utils = require("necabo.plugins.lspconfig.utils")

local config = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
  on_attach = lspconfig_utils.on_attach,
  capabilities = lspconfig_utils.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("lspconfig").pyright.setup(config)
