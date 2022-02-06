vim.opt.signcolumn = "yes"

require("gitsigns").setup({
  on_attach = function(bufnr)
    if vim.fn.has("0.7") == 1 then
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      map("n", "]h", gs.next_hunk)
      map("n", "[h", gs.prev_hunk)

      map("n", "<leader>hs", gs.stage_hunk)
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("n", "<leader>hu", gs.undo_stage_hunk)
      map("n", "<leader>hr", gs.reset_hunk)
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end)
      map("n", "<leader>hR", gs.reset_buffer)
      map("n", "<leader>hp", gs.preview_hunk)
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end)

      -- Text objects
      map({ "o", "x" }, "ih", ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>')
    else
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      map("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
      map("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")

      map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
      map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
      map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
      map("n", "<leader>hb", "<cmd>lua require'gitsigns'.blame_line{full = true}<CR>")
      map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
      map("n", "<leader>hD", "<cmd>lua require'gitsigns'.diffthis('~')<CR>")

      map("o", "<leader>ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
      map("x", "<leader>ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
    end
  end,
})
