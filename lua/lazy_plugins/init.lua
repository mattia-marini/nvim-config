local plugin_configs = 'plugin_configs'

local function from_module(name, mod_name, options)
  local rv = { name, config = function() require(plugin_configs .. '.' .. mod_name) end }
  if options then
    for key, value in pairs(options) do
      if not rv[key] then rv[key] = value end
    end
  end
  return rv
end

return {
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  from_module('L3MON4D3/LuaSnip', 'luasnips'),
  from_module('nvim-treesitter/nvim-treesitter', 'treesitter'),
  from_module('neovim/nvim-lspconfig', 'lsp'),

  from_module('hrsh7th/cmp-nvim-lsp', 'nvim-cmp'),
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },

  { 'mattia-marini/moontex.nvim',  ft = "tex" },
  { 'nvim-jdtls',                  ft = "java" },
  { 'mattia-marini/nvim-bufflist', config = function() require('bufflist') end },
  { 'numToStr/Comment.nvim',       config = function() require('Comment').setup() end },
  from_module('mattia-marini/runner.nvim', 'runner'),
  from_module('stevearc/oil.nvim', 'oil', { dependencies = { 'nvim-tree/nvim-web-devicons' } }),
  from_module('nvim-tree/nvim-tree.lua', 'tree'),
  from_module('kevinhwang91/nvim-ufo', 'ufo', { dependencies = { 'kevinhwang91/promise-async' } }),
  from_module('NeogitOrg/neogit', 'neogit', { dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }),
  from_module('nvim-lualine/lualine.nvim', 'lualine', { dependencies = { 'nvim-tree/nvim-web-devicons' } }),
  from_module('stevearc/conform.nvim', 'conform'),
}









































--[[
    { 'stevearc/conform.nvim'},
    {  'nvim-lualine/lualine.nvim',  },

    {  'NeogitOrg/neogit', dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } },
    { 'karb94/neoscroll.nvim'},
    { { 'kevinhwang91/nvim-ufo', dependencies = {'kevinhwang91/promise-async'} }},
    { 'nvim-tree/nvim-tree.lua'},
    {  'stevearc/oil.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require(plugin_configs..'.oil') end
      },
    { 'mfussenegger/nvim-jdtls'},
    { 'mattia-marini/runner.nvim'},
{ 'nvim-treesitter/nvim-treesitter' },
{ 'neovim/nvim-lspconfig', lazy=false, config = function() require(plugin_configs..'.lsp') end },
{ 'L3MON4D3/LuaSnip', lazy = false ,
config = function()
  require(plugin_configs..'.luasnips')
end
},
    use 'mfussenegger/nvim-lint'
    use 'wojciech-kulik/xcodebuild.nvim'

    use 'kilavila/nvim-bufferlist'
    use '/Users/mattia/Desktop/nvim-bufflist/'
    use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'lervag/vimtex'
    use 'vim-autoformat/vim-autoformat'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'nvim-treesitter/playground'
    use { 'nvim-treesitter/nvim-treesitter', event = 'BufRead', config = LoadTreesitter }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
      'nvim-telescope/telescope-file-browser.nvim',
      requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
    }
    use 'lewis6991/impatient.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
      'antosha417/nvim-lsp-file-operations',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-tree.lua',
      },
      config = function()
        require('lsp-file-operations').setup()
      end,
    }
    --]]
