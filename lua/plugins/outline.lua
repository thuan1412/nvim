local nvim_set_keymap = vim.api.nvim_set_keymap
local opts = { silent = true }
vim.g.symbols_outline = {
  symbol_blacklist = {
    "Variable",
  },
}
nvim_set_keymap("n", "<space>7", ":SymbolsOutline<CR>", opts)
