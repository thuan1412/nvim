local present, lspconfig = pcall(require, "lspconfig")
local lspconfig_util = require "lspconfig.util"
local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
  nvim_status = nil
end
if not present then
  print "lsp not found"
  return
end
--
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/thuando/software/lua-language-server"
local sumneko_binary = "/home/thuando/software/lua-language-server/bin/lua-language-server"
local lua_runtime_path = vim.split(package.path, ";")
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

local servers = {
  html = true,
  clangd = {
    cmd = {
      "clangd-12",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    -- Required for lsp-status
    init_options = {
      clangdFileStatus = true,
    },
    handlers = nvim_status and nvim_status.extensions.clangd.setup() or nil,
  },
  sumneko_lua = {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = lua_runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim", "use", "packer_bootstrap" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  tsserver = true,
  -- pyright = true,
  -- install: pip install "python-lsp-server[all]"
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pylint = {
            enabled = true,
          },
          -- pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
          rope_completion = { enabled = true },
        },
      },
    },
  },
  rust_analyzer = {
    cmd = { "~/.local/share/nvim/lsp_servers/rust/rust-analyzer" },
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
  -- eslint = true,
  volar = true,
  gopls = {
    root_dir = function(fname)
      local Path = require "plenary.path"

      local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
      local absolute_fname = Path:new(fname):absolute()

      if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
        return absolute_cwd
      end

      return lspconfig_util.root_pattern("go.mod", ".git")(fname)
    end,

    settings = {
      gopls = {
        codelenses = { test = true },
      },
    },

    flags = {
      debounce_text_changes = 200,
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  -- config = vim.tbl_deep_extend("force", {
  --   on_init = custom_init,
  --   on_attach = custom_attach,
  --   capabilities = updated_capabilities,
  --   flags = {
  --     debounce_text_changes = nil,
  --   },
  -- }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

-- old gopls configuration
-- lspconfig.gopls.setup {
--   cmd = { "gopls" },
--   settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
--   root_dir = require'lspconfig'.util.root_pattern(".git", "go.mod", "."),
--   init_options = { usePlaceholders = true, completeUnimported = true },
--   on_attach = attach,
--   capabilities = capabilities,
-- }

-- require'lspconfig'.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = lua_runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefault" .. name })
end

lspSymbol("Error", "???")
lspSymbol("Information", "???")
lspSymbol("Hint", "???")
lspSymbol("Warning", "???")
