local lsputil_codeAction = require "lsputil.codeAction"
local lsputil_locations = require "lsputil.locations"
local lsputil_symbols = require "lsputil.symbols"

if vim.fn.has("nvim-0.6") == 1 then
    vim.lsp.handlers["textDocument/codeAction"] = lsputil_codeAction.code_action_handler
    vim.lsp.handlers["textDocument/references"] = lsputil_locations.references_handler
    vim.lsp.handlers["textDocument/definition"] = lsputil_locations.definition_handler
    vim.lsp.handlers["textDocument/declaration"] = lsputil_locations.declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = lsputil_locations.typeDefinition_handler
    vim.lsp.handlers["textDocument/implementation"] = lsputil_locations.implementation_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = lsputil_symbols.document_handler
    vim.lsp.handlers["workspace/symbol"] = lsputil_symbols.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)
    vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
        lsputil_codeAction.code_action_handler(nil, actions, nil, nil, nil)
    end
    vim.lsp.handlers["textDocument/references"] = function(_, _, result)
        lsputil_locations.references_handler(nil, result, { bufnr = bufnr }, nil)
    end
    vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
        lsputil_locations.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end
    vim.lsp.handlers["textDocument/declaration"] = function(_, method, result)
        lsputil_locations.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end
    vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method, result)
        lsputil_locations.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end
    vim.lsp.handlers["textDocument/implementation"] = function(_, method, result)
        lsputil_locations.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end
    vim.lsp.handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
        lsputil_symbols.document_handler(nil, result, { bufnr = bufn }, nil)
    end
    vim.lsp.handlers["workspace/symbol"] = function(_, _, result, _, bufn)
        lsputil_symbols.workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end

local border_chars = {
	TOP_LEFT = '┌',
	TOP_RIGHT = '┐',
	MID_HORIZONTAL = '─',
	MID_VERTICAL = '│',
	BOTTOM_LEFT = '└',
	BOTTOM_RIGHT = '┘',
}

vim.g.lsp_utils_location_opts = {
    height = 0,
    mode = "editor",
    list = {
        border = true,
        border_chars = border_chars,
    },
    preview = {
        title = "Location Preview",
        border = true,
        border_chars = border_chars,
    },
    prompt = {},
}

vim.g.lsp_utils_symbols_opts = {
    height = 0,
    mode = "editor",
    list = {
        border = true,
        border_chars = border_chars,
    },
    preview = {
        title = "Symbol Preview",
        border = true,
        border_chars = border_chars,
    },
    prompt = {},
}
