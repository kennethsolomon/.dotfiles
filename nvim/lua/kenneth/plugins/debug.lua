-- debug.lua
--
-- DAP configuration for Laravel (PHP/Xdebug via Sail)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  keys = {
    { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
    { '<F1>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: Toggle Debugger UI' },
    { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
    {
      '<leader>dc',
      function()
        local configs = require('dap').configurations.php
        local names = {}
        for i, cfg in ipairs(configs) do
          table.insert(names, string.format("%d: %s", i, cfg.name))
        end
        vim.ui.select(names, { prompt = "Select PHP Debug Config:" }, function(choice)
          if choice then
            local index = tonumber(choice:match("^(%d+):"))
            if configs[index] then
              require('dap').run(configs[index])
            end
          end
        end)
      end,
      desc = "Debug: Choose Config"
    },
    {
      '<leader>dw',
      function()
        vim.ui.input({ prompt = 'Expression to watch: ' }, function(expr)
          if expr then
            require('dapui').elements.watches.add(expr)
          end
        end)
      end,
      desc = 'Debug: Add Watch'
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      ensure_installed = {
        'php',
      },
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
        php = function(config)
          dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = {
              os.getenv("HOME") .. '/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js',
            },
          }

          dap.configurations.php = {
            {
              name = "Listen for Xdebug (Sail)",
              type = "php",
              request = "launch",
              port = 9003,
              pathMappings = {
                ["/var/www/html"] = "${workspaceFolder}",
              },
            },
            {
              name = "Listen for Xdebug",
              type = "php",
              request = "launch",
              port = 9003,
            },
            {
              name = "Run PHPUnit (Feature Tests)",
              type = "php",
              request = "launch",
              port = 9003,
              program = "${workspaceFolder}/vendor/bin/phpunit",
              args = { "tests/Feature" },
              cwd = "${workspaceFolder}",
              console = "integratedTerminal",
            },
            {
              name = "Run Artisan Command",
              type = "php",
              request = "launch",
              port = 9003,
              program = "${workspaceFolder}/artisan",
              args = { "some:command" },
              cwd = "${workspaceFolder}",
              console = "integratedTerminal",
            },
          }

          require('mason-nvim-dap').default_setup(config)
        end,
      },
    }

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 }, -- 👈 Added Watches pane
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom",
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
