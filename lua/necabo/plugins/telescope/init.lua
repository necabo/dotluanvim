local utils = require "necabo.utils"

-- TODO: make this fallback to `find_files` when not in a Git repository
utils.map("n", "<leader>ff", "<cmd>Telescope git_files<cr>")
utils.map("n", "<leader>fa", "<cmd>Telescope find_files<cr>")
utils.map("n", "<leader>frg", "<cmd>Telescope live_grep<cr>")
utils.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
utils.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
