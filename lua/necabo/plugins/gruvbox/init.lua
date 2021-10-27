local utils = require("necabo.utils")

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight link sensibleWhitespaceError Error]])

-- no idea why this has to be in here but it doesn't work if it isn't
utils.create_augroup(
  { { [[Syntax * syntax match sensibleWhitespaceError excludenl /\v\s+%#@<!$| +\ze\t/ display containedin=ALL]] } },
  "necabo_highlight_whitespace_error"
)
