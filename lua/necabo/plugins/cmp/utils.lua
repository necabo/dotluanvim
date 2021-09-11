local M = {}

local luasnip = require "luasnip"
local lspkind = require "lspkind"

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.map_tab = function(fallback)
    if luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"))
    else
        fallback()
    end
end

M.map_super_tab = function(fallback)
    if luasnip.jumpable(-1) then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"))
    else
        fallback()
    end
end

M.entry_format = function(entry, vim_item)
    vim_item.kind = lspkind.presets.default[vim_item.kind]
    .. " "
    .. vim_item.kind

    vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
    })[entry.source.name]
    return vim_item
end

return M
