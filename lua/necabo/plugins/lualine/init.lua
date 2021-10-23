vim.opt.showmode = false

require("lualine").setup {
    options = {
        section_separators = "",
        component_separators = ""
    },
    sections = {
        lualine_b = {
            "branch",
            "diff"
        },
        lualine_c = {
            {"diagnostics", sources = {"nvim_lsp"}, icon = "λ"},
            "vim.b.lsp_current_function",
        },
        lualine_x = {
            "filename_right",
            "encoding",
            "fileformat",
            "filetype",
        }
    },
    inactive_sections = {
        lualine_c = {},
        lualine_x = {
            "filename_right",
            "location"
        },
    },
    extensions = {"quickfix"}
}
