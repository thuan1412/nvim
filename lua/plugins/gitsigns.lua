-- MAPPING
local nvim_set_keymap = vim.api.nvim_set_keymap

local opts = { silent = true }
-- nvim_set_keymap("n", "<space>t", "<cmd>Telescope<CR>", opts)
nvim_set_keymap("n", "]c", "<cmd>lua require'gitsigns'.next_hunk()<CR>", opts)
nvim_set_keymap("n", "[c", "<cmd>lua require'gitsigns'.prev_hunk()<CR>", opts)
nvim_set_keymap("n", "<space>gs", "<cmd>lua require'gitsigns'.stage_hunk()<CR>", opts)
nvim_set_keymap("n", "<space>gu", "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>", opts) -- unstage hunk
nvim_set_keymap("n", "<space>gp", "<cmd>lua require'gitsigns'.preview_hunk()<CR>", opts)
nvim_set_keymap("n", "<space>gx", "<cmd>lua require'gitsigns'.reset_hunk()<CR>", opts) -- discard change
nvim_set_keymap("n", "<space>gb", "<cmd>lua require'gitsigns'.blame_line()<CR>", opts)
nvim_set_keymap("n", "<space>gq", "<cmd>lua require'gitsigns'.setqflist('all')<CR>", opts)
