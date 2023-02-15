-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- colors
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })
  use 'sainnhe/gruvbox-material'
  use 'B4mbus/oxocarbon-lua.nvim'
  use 'savq/melange-nvim'
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'aktersnurra/no-clown-fiesta.nvim'
  use 'wincent/pinnacle'

  use({
    'catppuccin/vim',
    as = 'catppuccin',
  })


  -- UI
  use 'nvim-tree/nvim-web-devicons'

  -- Usability
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use "lukas-reineke/indent-blankline.nvim"
  use 'tpope/vim-surround'       -- surround object
  use 'tpope/vim-eunuch'         -- rename or move files
  use 'easymotion/vim-easymotion' -- easy motion
  use 'christoomey/vim-tmux-navigator'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'preservim/nerdtree'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP
  use "folke/neodev.nvim"
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
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  -- vim.cmd.colorscheme("gruvbox-material")
  -- vim.cmd.background("dark")
  vim.cmd.colorscheme("duskfox")
  -- vim.cmd.colorscheme("no-clown-fiesta")
  -- vim.cmd.colorscheme("oxocarbon-lua")
  -- vim.cmd.colorscheme("catppuccin_mocha")
  -- vim.cmd.colorscheme("catppuccin_macchiato")
  -- vim.cmd.colorscheme("catppuccin_frappe")
  -- vim.cmd.colorscheme("catppuccin_latte")
end)


