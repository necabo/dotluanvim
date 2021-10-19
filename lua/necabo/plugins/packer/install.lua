local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute "packadd packer.nvim"
end

return require("packer").startup {
    function()
        local use = use
        use "wbthomason/packer.nvim"
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                {"hrsh7th/cmp-buffer"},
                {"hrsh7th/cmp-nvim-lsp"},
                {"hrsh7th/cmp-nvim-lua"},
                {"hrsh7th/cmp-path"},
                {
                    "saadparwaiz1/cmp_luasnip",
                    requires = {
                        "L3MON4D3/LuaSnip",
                        "rafamadriz/friendly-snippets",
                    }
                },
                {"onsails/lspkind-nvim"}
            },
            config = [[require "necabo.plugins.cmp"]]
        }
        use {
            "npxbr/gruvbox.nvim",
            requires = {"rktjmp/lush.nvim"},
            config = [[require "necabo.plugins.gruvbox"]]
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = [[require "necabo.plugins.treesitter"]]
        }
        use {
            "neovim/nvim-lspconfig",
            config = [[require "necabo.plugins.lspconfig"]]
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    run = "make",
                }
            },
            config = [[require "necabo.plugins.telescope"]]
        }
        use {
            "windwp/nvim-autopairs",
            requires = {"hrsh7th/nvim-cmp"},
            config = [[require "necabo.plugins.autopairs"]],
            disable = true,
        }
        use {
            "hoob3rt/lualine.nvim",
            requires = {
                {"kyazdani42/nvim-web-devicons", opt = true},
                {
                    "nvim-lua/lsp-status.nvim",
                    requires = {"onsails/lspkind-nvim"},
                    config = [[require "necabo.plugins.lsp-status"]],
                },
            },
            config = [[require "necabo.plugins.lualine"]]
        }
        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = [[require "necabo.plugins.gitsigns"]]
        }
        use {
            "b3nj5m1n/kommentary",
            config = [[require "necabo.plugins.kommentary"]]
        }
        use {
            "blackCauldron7/surround.nvim",
            config = [[require "necabo.plugins.surround"]]
        }
        use {
            "onsails/lspkind-nvim",
            config = [[require "necabo.plugins.lspkind"]]
        }
        use {
            "steelsojka/pears.nvim",
            config = [[require "necabo.plugins.pears"]]
        }
        use {
            "RishabhRD/nvim-lsputils",
            requires = {"RishabhRD/popfix"},
            config = [[require "necabo.plugins.lsputils"]]
        }
        use {
            "kabouzeid/nvim-lspinstall",
            requires = {"neovim/nvim-lspconfig"},
            config = [[require "necabo.plugins.lspinstall"]]
        }
        use {
            "simrat39/rust-tools.nvim",
            requires = {"neovim/nvim-lspconfig"},
            config = [[require "necabo.plugins.lspconfig.rust-tools"]]
        }
    end
}
