-- general setting
-- local g = vim.g
-- local wo = vim.wo
-- local bo = vim.bo
local set = vim.opt

-- line number + width
set.relativenumber = true
set.number = true
set.numberwidth = 4
-- tabsize
local TAB_WIDTH = 2
set.tabstop = TAB_WIDTH
set.shiftwidth = TAB_WIDTH
set.expandtab = true

-- sync clipboard
set.clipboard = "unnamed,unnamedplus"

-- set smartcase
set.ignorecase = true
set.smartcase = true

-- others
set.cmdheight = 1
set.signcolumn = "yes"
set.timeoutlen = 500
set.undofile = true -- keep a permanent undo (across restarts)

-- set colorscheme
vim.g.tokyonight_style = "day" -- TODO: move this config into plugins/init.lua
vim.g.material_style = "oceanic"
--vim.cmd 'colorscheme material'
vim.cmd [[colorscheme tokyonight]]
require "settings.mappings"

-- disable copilot by default
vim.g.copilot_enabled = true
vim.g.copilot_no_tab_map = true -- bug conflict with cmp https://github.com/hrsh7th/nvim-cmp/issues/459
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
