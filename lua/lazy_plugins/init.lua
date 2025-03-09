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

  -- from_module('hrsh7th/cmp-nvim-lsp', 'nvim-cmp', { lazy = false }),
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-buffer' },
  -- { 'hrsh7th/cmp-path' },
  -- { 'hrsh7th/cmp-cmdline' },
  -- { 'hrsh7th/nvim-cmp' },
  --
  {
    'saghen/blink.cmp',
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    version = '*',
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 5,
        },
      },
      keymap = {
        preset = 'default',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-Enter>'] = { 'accept' },
      },
      cmdline = {
        keymap = {
          preset = 'default',
          ['<C-k>'] = { 'select_prev', 'fallback' },
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-Enter>'] = { 'accept' },
        },
        completion = {
          ghost_text = { enabled = false },
          menu = { auto_show = true }
        },
      }
    },
    opts_extend = { "sources.default" }
  },

  from_module('nvim-telescope/telescope.nvim', 'telescope', { dependencies = { 'nvim-lua/plenary.nvim' } }),

  from_module(
    "ThePrimeagen/harpoon",
    "harpoon",
    {
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
    }
  ),

  { 'mattia-marini/moontex.nvim',  ft = "tex" },
  { 'mattia-marini/nvim-bufflist', config = function() require('bufflist') end },
  -- { 'numToStr/Comment.nvim',       config = function() require('Comment').setup() end },
  from_module('mattia-marini/runner.nvim', 'runner'),
  from_module('stevearc/oil.nvim', 'oil', { dependencies = { 'nvim-tree/nvim-web-devicons' } }),
  from_module('nvim-tree/nvim-tree.lua', 'tree'),
  from_module('kevinhwang91/nvim-ufo', 'ufo', { dependencies = { 'kevinhwang91/promise-async' } }),
  from_module('NeogitOrg/neogit', 'neogit', { dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }),
  from_module('nvim-lualine/lualine.nvim', 'lualine', { dependencies = { 'nvim-tree/nvim-web-devicons' } }),
  from_module(
    "zbirenbaum/copilot.lua",
    "copilot",
    {
      cmd = "Copilot",
      event = "InsertEnter"
    }
  ),
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },                   -- or
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    version = "3.0.0"
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    "mattia-marini/chameleon.nvim",
    config = function()
      require("chameleon").setup()
    end,
  },
  -- from_module('mfussenegger/nvim-jdtls', 'jdtls', { ft = "java" }),
  from_module('stevearc/conform.nvim', 'conform'),
  from_module('echasnovski/mini.ai', 'mini-ai', { version = '*' }),

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- {
  --   'echasnovski/mini.pairs',
  --   version = false,
  --   config = { {
  --     modes = { insert = true, command = true, }
  --   } }
  -- },
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
