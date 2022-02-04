require("nvim-treesitter.configs").setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    javascript = {
      __default = "// %s",
      -- jsx_element = '{/* %s */}',
      -- jsx_fragment = '{/* %s */}',
      -- jsx_attribute = '// %s',
      comment = "// %s",
    },
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}
