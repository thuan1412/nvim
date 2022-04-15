local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = { "dap-float" },
  callback = function()
    local current_buf = api.nvim_get_current_buf()
    api.nvim_buf_set_keymap(current_buf, "n", "q", ":q<CR>", { noremap = true, silent = true })
  end,
})
