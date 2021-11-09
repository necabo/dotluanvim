local M = {}

local utils = require("necabo.utils")
local lsp_status = require("lsp-status")
local lspconfig_utils = require("necabo.plugins.lspconfig.utils")
local jdtls = require("jdtls")
local lsp_installer = require("nvim-lsp-installer")

local function jdtls_on_attach(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    -- JDTLS doesn't like formatting on BufWritePre for some reason and straight up deletes code randomly
    utils.create_buffer_augroup(
      { { [[BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()]] } },
      "necabo_format_on_save"
    )
  end

  if client.resolved_capabilities.document_highlight then
    utils.create_buffer_augroup({
      { [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]] },
      { [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]] },
    }, "necabo_highlight_references_below_cursor")
  end

  lspconfig_utils.setup_common_keymaps(bufnr)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "<leader>ca", "<cmd>lua require('jdtls').code_action()<CR>", opts)
  buf_set_keymap("n", "<leader>rr", "<cmd>lua require('jdtls').code_action(false, 'refactor')<CR>", opts)
  buf_set_keymap("v", "<leader>ca", "<cmd>lua require('jdtls').code_action(true)<CR>", opts)
  buf_set_keymap("v", "<leader>rr", "<cmd>lua require('jdtls').code_action(true, 'refactor')<CR>", opts)

  lsp_status.on_attach(client)

  jdtls.setup.add_commands()
end

local function make_default_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  capabilities.workspace.configuration = true
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return {
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = capabilities,
    on_attach = jdtls_on_attach,
  }
end

M.start_jdt = function()
  local _, requested_server = lsp_installer.get_server("jdtls")
  local config = make_default_config()
  config = vim.tbl_deep_extend("force", config, requested_server._default_options)
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  config = vim.tbl_deep_extend("force", config, {
    capabilities = extendedClientCapabilities,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = {
      java = {
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
      },
    },
  })

  jdtls.start_or_attach(config)
end

return M
