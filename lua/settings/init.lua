-- general setting
local g = vim.g
local wo = vim.wo
local bo = vim.bo
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
set.clipboard = "unnamedplus"

-- set smartcase
set.ignorecase = true
set.smartcase = true
set.undofile = true -- keep a permanent undo (across restarts)

-- others
set.cmdheight = 1

-- set colorscheme
vim.g.tokyonight_style = "day" -- TODO: move this config into plugins/init.lua
vim.g.material_style = "oceanic"
vim.cmd 'colorscheme material'
--vim.cmd[[colorscheme tokyonight]]
require('settings.mappings')
