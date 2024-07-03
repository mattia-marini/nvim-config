-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
--[[
require('packer').init({
  package_root   = "~/.config/nvim/packer"
})
--]]
return require('packer').startup(
-- Packer can manage itself
  function()
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use 'sainnhe/everforest'
    use 'mhartington/oceanic-next'
    use 'glepnir/oceanic-material'
    use 'projekt0n/github-nvim-theme'
    use { 'embark-theme/vim', as = 'embark' }
    use 'arzg/vim-colors-xcode'
    use 'morhetz/gruvbox'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'catppuccin/vim', as = 'catppuccin' }
    use 'joshdick/onedark.vim'
    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    --[[
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = false }
    }
    --]]
    use 'neovim/nvim-lspconfig'

    --use 'lervag/vimtex'
    --use 'vim-autoformat/vim-autoformat'
    --use 'SirVer/ultisnips'
    --use 'honza/vim-snippets'
    use 'L3MON4D3/LuaSnip'

    --use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter'
    --use { 'nvim-treesitter/nvim-treesitter', event = 'BufRead', config = LoadTreesitter }

    --[[
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    --]]
    --[[
  use {
     "nvim-telescope/telescope-file-browser.nvim",
     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  --]]
    -- use { 'ThePrimeagen/harpoon', requires = { "nvim-lua/plenary.nvim" } }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --use 'lewis6991/impatient.nvim'
    --use '~/Desktop/MoonTex'
    use "mattia-marini/MoonTex"
    use 'mfussenegger/nvim-jdtls'
    use 'stevearc/oil.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    --[[
    use "lukas-reineke/indent-blankline.nvim"
    use {
      "antosha417/nvim-lsp-file-operations",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-tree.lua",
      },
      config = function()
        require("lsp-file-operations").setup()
      end,
    }
    -]]
  end
)
