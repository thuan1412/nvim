-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function()
  -- copy from tj
  local local_use = function(first, second, opts)
    opts = opts or {}

    local plug_path, home
    if second == nil then
      plug_path = first
      home = "thuando"
    else
      plug_path = second
      home = first
    end

    if vim.fn.isdirectory(vim.fn.expand("~/code/vim-plugins/" .. plug_path)) == 1 then
      opts[1] = "~/code/vim-plugins/" .. plug_path
    else
      opts[1] = string.format("%s/%s", home, plug_path)
    end
    use(opts)
  end
  use "wbthomason/packer.nvim"
  use {
    "nvim-lua/plenary.nvim",
  }

  -- telescope
  use { "tami5/sqlite.lua" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use { "nvim-telescope/telescope-smart-history.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- stablize the popup
  use {
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  }

  -- tpope --
  use "tpope/vim-abolish"
  use "tpope/vim-repeat"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  -- use "tpope/vim-unimpaired"
  use "tpope/vim-dadbod"
  use {
    "tpope/vim-scriptease",
    cmd = {
      "Messages", --view messages in quickfix list
      "Verbose", -- view verbose output in preview window.
      "Time", -- measure how long it takes to run some stuff.
    },
  }

  -- comment
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- tree sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- themes/colorschemes
  use { "dracula/vim", as = "dracula" }
  use "folke/tokyonight.nvim"
  use "marko-cerovac/material.nvim"
  -- use https://github.com/nvim-lualine/lualine.nvim

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"

  -- luasnip source
  use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- git utils
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }
  use {
    "TimUntersberger/neogit",
    config = function()
      require("neogit").setup()
    end,
  }

  -- autopairs
  use {
    "windwp/nvim-autopairs",
  }

  -- impatent
  use "lewis6991/impatient.nvim"

  -- status line
  --
  use { "feline-nvim/feline.nvim" }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  use "mhartington/formatter.nvim"
  use { "kevinhwang91/nvim-hlslens" }

  -- icons
  use { "kyazdani42/nvim-web-devicons" }
  use {
    "ray-x/lsp_signature.nvim",
  }

  -- rust set up
  use "simrat39/rust-tools.nvim"
  -- use 'famiu/bufdelete.nvim'

  use "github/copilot.vim"

  use "lukas-reineke/indent-blankline.nvim"

  use "simrat39/symbols-outline.nvim"
  -- use {
  --
  --   "liuchengxu/vista.vim",
  --   cmd = "Vista",
  --   setup = function()
  --     require "plugins.vista"
  --   end,
  -- }

  use "kyazdani42/nvim-tree.lua"

  use "norcalli/nvim-colorizer.lua"

  use "ray-x/go.nvim"
  use {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup {}
      require("pretty-fold.preview").setup()
    end,
  }
  use "endel/vim-github-colorscheme"

  -- dap
  -- local_use "nvim-dap"
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"
  -- add fzf https://github.com/ibhagwan/fzf-lua
  -- add colorizer https://github.com/norcalli/nvim-colorizer.lua
end)
