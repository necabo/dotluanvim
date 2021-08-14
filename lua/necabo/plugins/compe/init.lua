local utils = require "necabo.utils"

utils.map("i", "<C-y>", "compe#confirm()", {silent = true, expr = true})

vim.opt.completeopt = {"menuone", "noselect"}

require("compe").setup {
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}
