vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use 'simnalamburt/vim-mundo'
  use 'vim-test/vim-test'
  use 'skywind3000/asyncrun.vim' -- for vim-test
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'godlygeek/tabular'
  use 'airblade/vim-gitgutter'
  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
  end
  }
  use {
      'ThePrimeagen/harpoon',
      requires = {
        'nvim-lua/plenary.nvim' -- compilations of lua functions
    },
  } 
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
  
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
  
      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

end)
