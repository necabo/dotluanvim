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
            "hrsh7th/nvim-compe",
            config = [[require "necabo.plugins.compe"]]
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
            requires = {{"nvim-lua/plenary.nvim"}},
            config = [[require "necabo.plugins.telescope"]]
        }
        use {
            "windwp/nvim-autopairs",
            config = [[require "necabo.plugins.autopairs"]]
        }
    end
}
