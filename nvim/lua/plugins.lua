return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ii14/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'neovim/nvim-lspconfig'
  use 'terrortylor/nvim-comment'
  use 'flazz/vim-colorschemes'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "ahmedkhalf/project.nvim"

  use({
    "kylechui/nvim-surround",
    tag = "*",
  })
end)
