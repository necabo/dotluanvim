local lspconfig_utils = require("necabo.plugins.lspconfig.utils")

local config = lspconfig_utils.make_default_config()

config = vim.tbl_deep_extend("force", config, {
  cmd = { "vscode-json-languageserver", "--stdio" },
})

require("lspconfig").jsonls.setup(config)
