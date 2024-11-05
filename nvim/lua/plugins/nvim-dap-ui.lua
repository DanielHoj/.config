-- Debugging Support
return {
  -- https://github.com/rcarriga/nvim-dap-ui
  'rcarriga/nvim-dap-ui',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    -- https://github.com/nvim-neotest/nvim-nio
    'nvim-neotest/nvim-nio',
    -- https://github.com/theHamsta/nvim-dap-virtual-text
    -- 'theHamsta/nvim-dap-virtual-text',   -- inline variable text while debugging
    -- https://github.com/nvim-telescope/telescope-dap.nvim
    'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap
  },
  opts = {
    controls = {
      element = "repl",
      enabled = false,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
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
            size = 0.50
          },
          {
            id = "stacks",
            size = 0.30
          },
          {
            id = "watches",
            size = 0.10
          },
          {
            id = "breakpoints",
            size = 0.10
          }
        },
        size = 40,
        position = "left", -- Can be "left" or "right"
      },
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
  },
  config = function(_, opts)
    local dap = require('dap')
    require('dapui').setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      require('dapui').open()
    end

    dap.adapters.python = {
      type = 'executable',
      command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python',
      args = { '-m', 'debugpy.adapter' },
    }

    -- Ensure `dap.configurations.python` is initialized
    if not dap.configurations.python then
      dap.configurations.python = {}
    end

    -- set the python adapter and config based on .daprc.lua file

    -- Helper function to find the root directory
    local function find_project_root()
      local cwd = vim.fn.getcwd()
      while cwd ~= "/" do
        if vim.fn.isdirectory(cwd .. "/.git") == 1 or vim.fn.filereadable(cwd .. "/.daprc.lua") == 1 then
          return cwd
        end
        cwd = vim.fn.fnamemodify(cwd, ":h")
      end
      return nil
    end

    -- Function to load project-specific DAP configuration
    local function load_project_dap_config()
      local project_root = find_project_root()
      if project_root then
        local daprc_path = project_root .. '/.daprc.lua'
        if vim.fn.filereadable(daprc_path) == 1 then
          -- Set a global variable for the project root
          vim.g.project_root = project_root
          local project_config = dofile(daprc_path)
          for _, config in ipairs(project_config) do
            table.insert(dap.configurations.python, config)
          end
        end
      end
    end

    -- Load project-specific DAP config when Neovim starts
    load_project_dap_config()
  end
}
