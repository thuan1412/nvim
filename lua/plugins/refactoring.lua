require("refactoring").setup {}

vim.api.nvim_set_keymap(
  "v",
  "<space>ref",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "v",
  "<space>rf",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "v",
  "<space>rev",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "v",
  "<space>ri",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap(
  "n",
  "<space>rb",
  [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
  { noremap = true, silent = true, expr = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<space>rbf",
  [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
  { noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap(
  "n",
  "<space>ri",
  [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  { noremap = true, silent = true, expr = false }
)

vim.api.nvim_set_keymap(
  "v",
  "<space>rv",
  ":lua require('refactoring').debug.print_var({below = true})<CR>",
  { noremap = true }
)
local ab = 10

vim.api.nvim_set_keymap(
  "n",
  "<space>rv",
  ":lua require('refactoring').debug.print_var({below = true})<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<space>rp",
  ":lua require('refactoring').debug.printf({below = true})<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap("n", "<space>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })
