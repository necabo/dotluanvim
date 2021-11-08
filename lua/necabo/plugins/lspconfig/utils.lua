local M = {}

local nvim_lsp = require("lspconfig")
local utils = require("necabo.utils")
local lsp_status = require("lsp-status")

M.on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    -- JDTLS doesn't like formatting on BufWritePre for some reason and straight up deletes code randomly
    if client.name == "java" then
      utils.create_buffer_augroup(
        { { [[BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()]] } },
        "necabo_format_on_save"
      )
    else
      utils.create_buffer_augroup(
        { { [[BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]] } },
        "necabo_format_on_save"
      )
    end
  end

  if client.resolved_capabilities.document_highlight then
    utils.create_buffer_augroup({
      { [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]] },
      { [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]] },
    }, "necabo_highlight_references_below_cursor")
  end

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  buf_set_keymap("n", "<leader>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)

  lsp_status.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

M.make_default_config = function()
    return {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

M.setup_servers = function(servers)
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(M.make_default_config())
  end
end

return M
