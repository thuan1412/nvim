local has_dap, dap = pcall(require, "dap")
if not has_dap then
  print "dap not found"
  return
end

dap.set_log_level "TRACE"

local map = vim.api.nvim_set_keymap

-- sign_define defines a sign/icon with the given name and the given icon.
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🙅", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "✋", texthl = "", linehl = "", numhl = "" })

local map_ops = { noremap = true, silent = true }
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", map_ops)
map("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>", map_ops)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", map_ops)
map("n", "<leader>dh", ":lua require'dap.ui.widgets'.hover()<CR>", map_ops)

map("n", "<F1>", ":lua require('dap').step_back()<CR>", map_ops)
map("n", "<F2>", ":lua require('dap').step_into()<CR>", map_ops)
map("n", "<F3>", ":lua require('dap').step_over()<CR>", map_ops)
map("n", "<F4>", ":lua require('dap').step_out()<CR>", map_ops)
map("n", "<F5>", ":lua require('dap').continue()<CR>", map_ops)

require("nvim-dap-virtual-text").setup {
  enabled = true,

  -- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
  enabled_commands = false,

  -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_changed_variables = true,
  highlight_new_as_changed = true,

  -- prefix virtual text with comment string
  commented = false,

  show_stop_reason = true,

  -- experimental features:
  virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
}

--  https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/dap.lua#L180
--  https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
dap.adapters.go = function(callback, _)
  local stdout = vim.loop.new_pipe(false)
  local handle, pid_or_err
  local port = 38697

  handle, pid_or_err = vim.loop.spawn("dlv", {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }, function(code)
    stdout:close()
    handle:close()

    print("[delve] Exit Code:", code)
  end)

  assert(handle, "Error running dlv: " .. tostring(pid_or_err))

  stdout:read_start(function(err, chunk)
    assert(not err, err)

    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
        print("[delve]", chunk)
      end)
    end
  end)

  -- Wait for delve to start
  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = ".",
    showLog = true,
  },
  {
    type = "go",
    name = "Debug cmd folder",
    request = "launch",
    program = "cmd/*.go",
    cwd = "/home/thuando/code/golang/go-dap-test/cmd",
    showLog = true,
    args = { "server" },
  },
  {
    type = "go",
    name = "Debug cmd server (tekoneee)",
    request = "launch",
    program = "cmd",
    cwd = "/home/thuando/code/teko/tekone/app/saasmarket/core-service",
    showLog = true,
    args = { "server" },
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

vim.fn.dap_curle = function(arg)
  require("dap").run {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
    args = arg,
  }
end
