require "settings"
require "settings.globals"
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
require "plugins.dap"
require "plugins.refactoring"
require "plugins.dressing"
require "plugins.neoclip"
require "plugins.neogit"

require("colorizer").setup {
  "!*",
}
require("rust-tools").setup {}
require("go").setup()

require("lsp_signature").setup()
-- require("hlslens").stetup()
--
-- fold
-- add autocmd to save view when buf close and load view when open file
vim.cmd "autocmd BufWinLeave *.* mkview"
vim.cmd "autocmd BufWinEnter *.* silent loadview"
