local present, tree = pcall(require, "nvim-tree")
if not present then
  print "nvimtree is not exist"
end

local function getDirFromPath(path)
  if path:match "/" then
    return path:match "(.*)/"
  else
    return path:match "(.*)\\"
  end
end

local function findInFolder(node)
  local absolute_path = node.absolute_path
  local dir = getDirFromPath(absolute_path)
  require("telescope.builtin").live_grep { cwd = dir }
end

tree.setup {
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = false,
  auto_reload_on_write = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 50,
    height = 30,
    hide_root_folder = false,
    side = "right",
    preserve_window_proportions = false,
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "o", "l" }, action = "edit" },
        { key = "<C-o>", action = "edit_in_place" },
        { key = { "O" }, action = "edit_no_picker" },
        { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "h", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "I", action = "toggle_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[c", action = "prev_git_item" },
        { key = "]c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        { key = "s", action = "system_open" },
        { key = "q", action = "close" },
        { key = "?", action = "toggle_help" },
        { key = "W", action = "collapse_all" },
        { key = "S", action = "search_node" },
        { key = "<C-k>", action = "toggle_file_info" },
        { key = ".", action = "run_file_command" },
        { key = "f", action = "find in folder", action_cb = findInFolder },
      },
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}
