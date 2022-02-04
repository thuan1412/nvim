-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()

  use {
    "nvim-lua/plenary.nvim",
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    require = {
      ""
    }
  }

  -- stablize the popup
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }

  -- tpope --
  use 'tpope/vim-abolish'
  use 'tpope/vim-repeat'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dadbod'

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- themes/colorschemes
  use {'dracula/vim', as = 'dracula'}
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  -- use https://github.com/nvim-lualine/lualine.nvim

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
  }

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  -- luasnip source
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- git utils
  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
    end
  }
  use {
    'TimUntersberger/neogit',
    config = function ()
      require('neogit').setup()
    end
  }

  -- impatent
  use 'lewis6991/impatient.nvim'

  -- status line
  --
  use { 'feline-nvim/feline.nvim' }

  -- icons
  use { 'kyazdani42/nvim-web-devicons' }
  -- use 'famiu/bufdelete.nvim'
end)
