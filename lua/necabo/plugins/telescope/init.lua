local utils = require "necabo.utils"

utils.map(
    "n", "<leader>ff",
    "v:lua.necabo.is_git_repo() ? '<cmd>Telescope git_files<cr>' : '<cmd>Telescope find_files<cr>'",
    {expr = true}
)
utils.map("n", "<leader>fa", "<cmd>Telescope find_files<cr>")
utils.map("n", "<leader>frg", "<cmd>Telescope live_grep<cr>")
utils.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
utils.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
