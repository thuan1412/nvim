local present, cmp = pcall(require, "cmp")

if not present then
  print("cmp is not present")
   return
end

vim.opt.completeopt = "menuone,noselect"
require("luasnip.loaders.from_vscode").load()

-- config luasnip
local luasnip = require("luasnip")
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("javascriptreact", { "javascript" })
luasnip.filetype_extend("typescriptreact", { "javascriptreact", "typescript", "javascript" })

-- require("luasnip.loaders.from_vscode").lazy_load()
-- local nvim_set_keymap = vim.api.nvim_set_keymap
-- nvim_set_keymap("n", "3", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- cmp.event:on('confirm_done', function ()
--   -- get current location
--   local ts_utils = require "nvim-treesitter.ts_utils"
--   local cursor_node = ts_utils.get_node_at_cursor()
--   print("------------------")
--   print(cursor_node:type())
--   -- TODO check whether it's in a fucntion call, check signature of function call
-- end)

-- nvim-cmp setup
cmp.setup {
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
      format = function(entry, vim_item)
         -- load lspkind icons
         -- vim_item.kind = string.format(
         --    "%s %s",
         --    require("plugins.configs.lspkind_icons").icons[vim_item.kind],
         --    vim_item.kind
         -- )

         vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            buffer = "[BUF]",
         })[entry.source.name]

         return vim_item
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      -- ["<CR>"] = cmp.mapping(function ()
      --   cmp.confirm({
      --      behavior = cmp.ConfirmBehavior.Replace,
      --      select = true,
      --   })vim.lsp.buf.type_definition
      -- end),
      -- function(fallback)
      --   print("confirm function is called", fallback)
      --   cmp.confirm {
      --      behavior = cmp.ConfirmBehavior.Replace,
      --      select = true,
      --   }
      -- end,
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      -- setting for Copilot, don't know why it's set in here
      ["<C-y>"] = cmp.mapping(function()
        local copilot_keys = vim.fn["copilot#Accept"]()
        if copilot_keys ~= "" then
          vim.api.nvim_feedkeys(copilot_keys, "i", true)
        end
      end, {"i", "s"}),
   },
   sources = {
      { name = "luasnip" },
      { name = "nvim_lsp", keyword_length=1 },
      { name = "buffer", keyword_length=1 },
      { name = "nvim_lua" },
      { name = "path" },
   },
}
