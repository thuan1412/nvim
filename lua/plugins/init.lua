-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

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

  -- themes/colorschemes
  use {'dracula/vim', as = 'dracula'}
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  -- use https://github.com/nvim-lualine/lualine.nvim
end)
