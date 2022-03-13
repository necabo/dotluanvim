vim.opt.hidden = true
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.inccommand = "nosplit"
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
vim.opt.display = "lastline"
vim.opt.listchars = { tab = "> ", trail = "-", extends = ">", precedes = "<", nbsp = "+" }
vim.opt.shortmess:append({ c = true })
vim.opt.updatetime = 250
vim.g.tex_flavor = "latex"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
