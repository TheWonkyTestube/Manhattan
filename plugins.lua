-- Only required if you have packer configured as `opt
vim.cmd [[packadd packer.nvim]]
local fn = vim.fn

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'									-- Plugin Manager
  use "nvim-lua/popup.nvim"										-- Popup addon

  -- General Use Plugins
  use "Pocco81/auto-save.nvim"
  use 'ibhagwan/fzf-lua'										-- Fuzzy finder		
  use { "catppuccin/nvim", as = "catppuccin" }					-- Colorscheme
  use "windwp/nvim-autopairs"									-- Automatically pairs up brackets and quotes
  use "ur4ltz/surround.nvim"									-- Allows you to surround things with the above
  use {
	'nvim-lualine/lualine.nvim',								-- Handy lil statusline at the bottom
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "nvim-tree/nvim-tree.lua"									-- File Browser
  use "terrortylor/nvim-comment"								-- Toggles Comments
  use "nvim-treesitter/nvim-treesitter"							-- Super Duper highlighting
  use "nvim-treesitter/playground"								-- Lets you look under the hood of how the highlighting works
  use "norcalli/nvim-colorizer.lua"								-- Highlights hex colors
  use {'akinsho/bufferline.nvim', tag = "v3.*", 				-- Adds a superduper tab bar
	requires = 'nvim-tree/nvim-web-devicons'				
  }
  use "mbbill/undotree"
  use "iamcco/markdown-preview.nvim"
  use "rmagatti/auto-session"

  -- Plugins for writing Prose
  use 'vim-pandoc/vim-pandoc-syntax'							-- Pandoc Syntax
  use "preservim/vim-pencil"									-- Wraps text Nicely
  use "preservim/vim-wordy"										-- Highlights overused words
  use "preservim/vim-litecorrect"								-- Quickly corrects common mistakes
  use "junegunn/goyo.vim"										-- A focus mode that hides the screen
  use "junegunn/limelight.vim"									-- A focus mode that highlights the current paragraph
  use "preservim/vim-lexical"

  -- Plugins for LSP etc
  use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
	  -- LSP Support
	  {'neovim/nvim-lspconfig'},             -- Required
	  {                                      -- Optional
		'williamboman/mason.nvim',
		run = function()
		  pcall(vim.cmd, 'MasonUpdate')
		end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-buffer'},     -- Required
	  {'hrsh7th/cmp-path'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	}
  }
  use {'L3MON4D3/LuaSnip'}     -- Required
  use {
	'aspeddro/cmp-pandoc.nvim',
	requires = {
	  'nvim-lua/plenary.nvim',
	  'jbyuki/nabla.nvim' -- optional
	}
  }
  use { "rafamadriz/friendly-snippets"}
end)
