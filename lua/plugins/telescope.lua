local present, telescope = pcall(require, "telescope")
local actions = require "telescope.actions"
if not present then
  print "telescope is not exist"
  return
end

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.cycle_history_next,
        ["<C-j>"] = actions.cycle_history_prev,
      },
    },
    -- file_sorter = require("telescope.sorters").get_fuzzy_file, -- TODO: fix
    file_ignore_patterns = { "node_modules", "venv", "pb.go", "pb2.py", "validate.go", "gw.go" },
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "absolute" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    -- media_files = {
    --   filetypes = { "png", "webp", "jpg", "jpeg" },
    --   find_cmd = "rg", -- find command (defaults to `fd`)
    -- },
    path_display = function(opts, path)
      -- local cwd = vim.fn.expand("%:p:h")
      local res_path = vim.fn.fnamemodify(path, ":.")
      return res_path
    end,
  },
  pickers = {
    lsp_references = {
      initial_mode = "normal",
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
      },
      path_display = function(opts, path)
        -- local cwd = vim.fn.expand("%:p:h")
        local res_path = vim.fn.fnamemodify(path, ":.")
        return res_path
      end,
      -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    },
    lsp_implementations = {
      initial_mode = "normal",
      layout_strategies = "vertical",
      layout_config = {
        vertical = {
          prompt_position = "top",
          height = 0.3,
          width = 0.85,
          preview_height = 0.5,
        },
      },
    },
    quickfix = {
      initial_mode = "normal",
      layout_strategies = "vertical",
      layout_config = {
        vertical = {
          height = 0.3,
          width = 0.85,
          preview_height = 0.5,
        },
      },
    },
    oldfiles = {
      initial_mode = "normal",
      path_display = function(opts, path)
        -- local cwd = vim.fn.expand("%:p:h")
        local res_path = vim.fn.fnamemodify(path, ":.")
        return res_path
      end,
    },
    lsp_code_actions = {
      initial_mode = "normal",
    },
    lsp_definitions = {
      initial_mode = "normal",
    },
    lsp_dynamic_workspace_symbols = {
      path_display = function(opts, path)
        -- local cwd = vim.fn.expand("%:p:h")
        local res_path = vim.fn.fnamemodify(path, ":.")
        return res_path
      end,
    },
    neoclip = {
      initial_mode = "normal",
      layout_strategies = "vertical",
      layout_config = {
        vertical = {
          prompt_position = "top",
          height = 0.3,
          width = 0.85,
          preview_height = 0.5,
        },
      },
    },
  },
}

local extensions = {
  -- "fzf",
  "smart_history",
  "neoclip",
}

for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end
