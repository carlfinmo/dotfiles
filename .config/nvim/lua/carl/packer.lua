vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use "rebelot/kanagawa.nvim"
  use 'simnalamburt/vim-mundo'
  use {
      'nvim-neotest/neotest',
      requires = {
          "nvim-lua/plenary.nvim",
          "antoinemadec/FixCursorHold.nvim",
          "nvim-neotest/neotest-go",
          "nvim-neotest/neotest-python",
          "rouge8/neotest-rust",
          "sidlatau/neotest-dart",
      }
  }
  use 'gerazov/toggle-bool.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use('fatih/vim-go', {run = ':GoUpdateBinaries'})
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'godlygeek/tabular'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/trouble.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
  end
  }
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }
  use {
      'ThePrimeagen/harpoon',
      branch = "harpoon2",
      requires = {
        'nvim-lua/plenary.nvim' -- compilations of lua functions
    },
  } 
  use {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'}, -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
      -- {'natebosch/dartlang-snippets'},
  
    use 'mhartington/formatter.nvim',
  
  }
end)
