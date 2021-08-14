vim.opt.showmode = false

require("lualine").setup {
    options = {
        section_separators = "",
        component_separators = ""
    },
    extensions = {"quickfix"}
}
