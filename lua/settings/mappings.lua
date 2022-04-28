-- Telescope
local nvim_set_keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
-- Telescope utils
nvim_set_keymap("n", "<space>tt", "<cmd>Telescope<CR>", opts)
nvim_set_keymap("n", "<space>tr", "<cmd>Telescope resume<CR>", opts)
nvim_set_keymap("n", "<space>w", "<cmd>Telescope live_grep<CR>", opts)
nvim_set_keymap("n", "<space>q", "<cmd>Telescope quickfix<CR>", opts)
nvim_set_keymap("n", "<space>cm", "<cmd>Telescope commands<CR>", opts)
nvim_set_keymap("n", "<space>ch", "<cmd>Telescope command_history<CR>", opts)
nvim_set_keymap("n", "<space>ff", "<cmd>Telescope find_files<CR>", opts)
nvim_set_keymap("n", "<space>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
nvim_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
nvim_set_keymap("n", "<space>b", "<cmd>Telescope buffers<CR>", opts)
-- nvim_set_keymap("n", "<space>fh", "<cmd>Telescope find_files hidden=true<CR>", opts)
nvim_set_keymap("n", "<space>h", "<cmd>Telescope oldfiles only_cwd=true<CR>", opts)
nvim_set_keymap("n", "<space>km", "<cmd>Telescope keymaps<CR>", opts)
nvim_set_keymap("n", "<space>gstt", "<cmd>Telescope git_status<CR>", opts)
nvim_set_keymap("n", "<space>gsth", "<cmd>Telescope git_stash<CR>", opts)
nvim_set_keymap("n", "<space>gcm", "<cmd>Telescope git_commits<CR>", opts)
nvim_set_keymap("n", "<space>gcbm", "<cmd>Telescope git_bcommits<CR>", opts)
nvim_set_keymap("n", "<space>ss", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
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

-- nvim tree
nvim_set_keymap("n", "<space>e", ":NvimTreeToggle <CR>", opts)
nvim_set_keymap("n", "<A-e>", ":NvimTreeToggle <CR>", opts)

nvim_set_keymap("n", "<space>so", ":so ~/.config/nvim/init.lua<CR>", opts)

-- override windows switch keymaps
nvim_set_keymap("n", "<A-v>", ":vsplit <CR>", opts)
nvim_set_keymap("n", "<A-s>", ":split <CR>", opts)
nvim_set_keymap("n", "<A-c>", ":close <CR>", opts)
nvim_set_keymap("n", "<A-o>", "<C-w>o", opts)
nvim_set_keymap("n", "<A-H>", "<C-w>H", opts)
nvim_set_keymap("n", "<A-K>", "<C-w>K", opts)

nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })

-- change window size
nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

nvim_set_keymap("n", "]t", ":tabnext<CR>", { noremap = true, silent = true })
nvim_set_keymap("n", "[t", ":tabprev<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
