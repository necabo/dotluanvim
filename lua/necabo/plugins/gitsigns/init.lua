vim.opt.signcolumn = "yes"

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
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
  end,
})
