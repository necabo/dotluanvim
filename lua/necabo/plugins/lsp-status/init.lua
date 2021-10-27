local lspkind = require("lspkind")

require("lsp-status").config({
  kind_labels = lspkind.presets.default,
  status_symbol = "λ",
})
