-- Telescope
local nvim_set_keymap = vim.api.nvim_set_keymap

local opts = { silent = true }
-- Telescope utils
nvim_set_keymap("n", "<space>t", "<cmd>Telescope<CR>", opts)
nvim_set_keymap("n", "<space>f", "<cmd>Telescope find_files<CR>", opts)
nvim_set_keymap("n", "<space>a", "<cmd>Telescope code_actions<CR>", opts)
nvim_set_keymap("n", "<space>b", "<cmd>Telescope buffers<CR>", opts)
-- nvim_set_keymap("n", "<space>fh", "<cmd>Telescope find_files hidden=true<CR>", opts)
nvim_set_keymap("n", "<space>h", "<cmd>Telescope oldfiles only_cwd=true<CR>", opts)


-- LSP API
nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- TODO: update the path_dispay function
nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
nvim_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations path_display={'shorten'}<CR>", opts)
