require "settings"
require "impatient"
----- PLUGINS
require "plugins"

require "plugins.lsp"
require "plugins.nvim-treesitter"
require "plugins.Comment"
require "plugins.cmp"
require "plugins.gitsigns"
require "plugins.formatter"
require "plugins.autopairs"
require "plugins.telescope"
require "plugins.indent-blankline"
require "plugins.nvimtree"
require "plugins.feline"
require "plugins.outline"
require("colorizer").setup {
  "!*",
}
require("rust-tools").setup {}
require("go").setup()
-- TODO: IDK, lsp_signature is not available at the very time
require("lsp_signature").setup()
-- require("hlslens").stetup()
--
-- fold
-- add autocmd to save view when buf close and load view when open file
vim.cmd("autocmd BufWinLeave *.* mkview")
vim.cmd("autocmd BufWinEnter *.* silent loadview")
