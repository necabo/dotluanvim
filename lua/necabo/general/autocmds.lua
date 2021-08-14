local utils = require "necabo.utils"

utils.create_augroup({{[[BufWritePost install.lua source <afile> | PackerCompile]]}}, "necabo_auto_packer_compile")
utils.create_augroup({{[[TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]}}, "necabo_highlight_yank")
