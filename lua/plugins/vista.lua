local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { silent = true }

vim.cmd("let g:vista_sidebar_width=50")
nvim_set_keymap("n", "<space>7", ":Vista!! <CR>", opts)
