require("surround").setup({
  pairs = {
    nestable = { { "(", ")" }, { "[", "]" }, { "{", "}", "<", ">" } },
    linear = { { "'", "'" }, { '"', '"' } },
  },
  mappings_style = "surround",
})
