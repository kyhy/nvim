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
	  config = function()
		  -- require("rose-pine").setup()
		  -- vim.cmd('colorscheme rose-pine')
	  end
  })
  use 'gruvbox-community/gruvbox'
  use 'B4mbus/oxocarbon-lua.nvim'
  use 'savq/melange-nvim'

  -- Usability
  use 'tpope/vim-surround'       -- surround object
  use 'tpope/vim-eunuch'         -- rename or move files
  use 'easymotion/vim-easymotion' -- easy motion
  use 'christoomey/vim-tmux-navigator'

  use 'windwp/nvim-autopairs'
  use 'christoomey/vim-tmux-navigator'
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
end)
