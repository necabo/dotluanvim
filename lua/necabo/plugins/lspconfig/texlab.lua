local lspconfig_utils = require("necabo.plugins.lspconfig.utils")

-- texlab requires 'texlive-latexindent-meta' for latexindent to be available
require("lspconfig").texlab.setup({
  settings = {
    texlab = {
      build = {
        onSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
    },
  },
  on_attach = lspconfig_utils.on_attach,
  capabilities = lspconfig_utils.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
})
