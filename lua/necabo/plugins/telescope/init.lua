local utils = require "necabo.utils"
local telescope = require "telescope"

local find_all_files_cmd = "<cmd>lua require(''telescope.builtin'').find_files({no_ignore = true, hidden = true})<cr>"

utils.map(
    "n", "<leader>ff",
    "v:lua.necabo.is_git_repo() ? '<cmd>Telescope git_files<cr>' : '" .. find_all_files_cmd .. "'",
    {expr = true}
)
utils.map("n", "<leader>fa", find_all_files_cmd)
utils.map("n", "<leader>frg", "<cmd>Telescope live_grep<cr>")
utils.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
utils.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

telescope.load_extension("fzf")
