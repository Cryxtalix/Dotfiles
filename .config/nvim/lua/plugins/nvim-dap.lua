return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local virtual_text = require("nvim-dap-virtual-text")

   dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-dap',
      name = 'lldb'
    }

    local lldb = {
      name = "Launch lldb",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input(
          "Path to executable: ", vim.fn.getcwd() .. "/", "file"
        )
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    }

    dap.configurations.rust = {lldb}
    dap.configurations.c = {lldb}

    dapui.setup(
      {
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "🔗❌",
            pause = "⏸",
            play = "▶",
            run_last = "⏭",
            step_back = "↶",
            step_into = "↓",
            step_out = "↑",
            step_over = "↷",
            terminate = "⏹"
          }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" }
          }
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = ""
        },
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25
              },
              {
                id = "breakpoints",
                size = 0.25
              },
              {
                id = "stacks",
                size = 0.25
              },
              {
                id = "watches",
                size = 0.25
              }
            },
            position = "left",
            size = 40
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5
              },
              {
                id = "console",
                size = 0.5
              }
            },
            position = "bottom",
            size = 10
          }
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t"
        },
        render = {
          indent = 1,
          max_value_lines = 100
        }
      }
    )

    virtual_text.setup()

    vim.api.nvim_create_user_command(
      "Debug",
      function()
        dapui.toggle()
      end,
      {}
    )
    vim.keymap.set('n', "<Leader>b", dap.toggle_breakpoint, {})
    vim.keymap.set('n', "<F2>", dap.continue, {})
    vim.keymap.set('n', "<F3>", dap.step_over, {})
    vim.keymap.set('n', "<F4>", dap.step_back, {})
    vim.keymap.set('n', "<F5>", dap.step_into, {})
    vim.keymap.set('n', "<F6>", dap.step_out, {})
    vim.keymap.set('n', "<Leader>n", dap.restart, {})
  end
}
