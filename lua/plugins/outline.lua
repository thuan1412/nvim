local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { silent = true }
nvim_set_keymap("n", "<space>7", ":SymbolsOutline<CR>", opts)
