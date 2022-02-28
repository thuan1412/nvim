-- Telescope
local nvim_set_keymap = vim.api.nvim_set_keymap

local opts = { silent = true }
-- Telescope utils
nvim_set_keymap("n", "<space>tt", "<cmd>Telescope<CR>", opts)
nvim_set_keymap("n", "<space>tr", "<cmd>Telescope resume<CR>", opts)
nvim_set_keymap("n", "<space>w", "<cmd>Telescope live_grep<CR>", opts)
nvim_set_keymap("n", "<space>q", "<cmd>Telescope quickfix<CR>", opts)
nvim_set_keymap("n", "<space>c", "<cmd>Telescope commands<CR>", opts)
nvim_set_keymap("n", "<space>ch", "<cmd>Telescope command_history<CR>", opts)
nvim_set_keymap("n", "<space>f", "<cmd>Telescope find_files<CR>", opts)
nvim_set_keymap("n", "<space>a", "<cmd>Telescope lsp_code_actions<CR>", opts)
nvim_set_keymap("n", "<space>b", "<cmd>Telescope buffers<CR>", opts)
-- nvim_set_keymap("n", "<space>fh", "<cmd>Telescope find_files hidden=true<CR>", opts)
nvim_set_keymap("n", "<space>h", "<cmd>Telescope oldfiles only_cwd=true<CR>", opts)
nvim_set_keymap("n", "<space>km", "<cmd>Telescope keymaps<CR>", opts)
nvim_set_keymap("n", "<space>gstt", "<cmd>Telescope git_status<CR>", opts)
nvim_set_keymap("n", "<space>gsth", "<cmd>Telescope git_stash<CR>", opts)
nvim_set_keymap("n", "<space>gcm", "<cmd>Telescope git_commits<CR>", opts)
nvim_set_keymap("n", "<space>gcbm", "<cmd>Telescope git_bcommits<CR>", opts)
nvim_set_keymap("n", "<space>s", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)

nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- LSP API
-- TODO: remove unimpairs [e mapping
-- nvim_set_keymap(
--   "n",
--   "]e",
--   "<cmd>lua vim.lsp.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
--   opts
-- )
-- nvim_set_keymap(
--   "n",
--   "[e",
--   "<cmd>lua vim.lsp.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
--   opts
-- )
-- nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next({severity = vim.diagnostic.severity.INFO})<CR>", opts)
-- nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev({severity = vim.diagnostic.severity.INFO})<CR>", opts)
nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- TODO: update the path_dispay function
nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
nvim_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations path_display={'shorten'}<CR>", opts)

-- Format
nvim_set_keymap("n", "<leader>f", "<cmd> Format<CR>", opts)
nvim_set_keymap("n", "<Esc>", "<cmd>:noh<CR>", opts)

-- <leader>w for save file
nvim_set_keymap("n", "<leader>w", ":w <CR>", { noremap = true, silent = true })
