require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
})

require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
