local utils = require "necabo.utils"
local cmp_utils = require "necabo.plugins.cmp.utils"

local cmp = require "cmp"
cmp.setup {
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        -- TODO: find a suitable mapping: ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-j>"] = cmp.mapping(cmp_utils.map_tab, {"i", "s"}),
        ["<C-k>"] = cmp.mapping(cmp_utils.map_super_tab, {"i", "s"}),

        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = {
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" }
    },
    formatting = {
        format = cmp_utils.entry_format
    }
}

utils.create_augroup({{
[[FileType lua lua require("cmp").setup.buffer {]],
[[      sources = {                             ]],
[[{         name = 'buffer' },                  ]],
[[{         name = 'nvim_lua' },                ]],
[[{         name = 'luasnip' },                 ]],
[[{         name = 'path' }                     ]],
[[      },                                      ]],
[[}                                             ]],
}}, "necabo_setup_lua_cmp")
