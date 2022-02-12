local js_and_friends = {
  -- prettier
  function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        vim.api.nvim_buf_get_name(0),
        -- "--single-quote",
      },
      stdin = true,
    }
  end,
}
require("formatter").setup {
  logging = false,
  filetype = {
    javascriptreact = js_and_friends,
    javascript = js_and_friends,
    typescriptreact = js_and_friends,
    typescript = js_and_friends,
    vue = js_and_friends,
    rust = {
      -- Rustfmt
      function()
        return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
      end,
    },
    go = {
      function()
        return { exe = "gofmt", args = {}, stdin = true }
      end,
    },
    python = {
      function()
        return {
          exe = "autopep8",
          args = {
            "--in-place --aggressive --aggressive",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = false,
        }
      end,
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "stylua",
          args = {
            "--indent-width 2",
            -- "--config-path "
            -- .. os.getenv "XDG_CONFIG_HOME",
            -- .. "/stylua/stylua.toml",
            -- ,
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
}
