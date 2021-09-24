local utils = require "necabo.utils"

utils.map("i", "<C-U>", "<C-G>u<C-U>")
utils.map("i", "<C-W>", "<C-G>u<C-W>")

utils.map("n", "<leader>/", ":nohlsearch<CR>", {silent = true})

-- Copy & Paste
utils.map("n", "Y", "y$")
utils.map("v", "<leader>y", '"+y')
utils.map("n", "<leader>y", '"+y')
utils.map("n", "<leader>Y", '"+Y', {noremap = false})
utils.map("n", "<leader>p", '"+p')
utils.map("n", "<leader>P", '"+P')
