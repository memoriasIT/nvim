return {
  "nvim-flutter/flutter-tools.nvim",
  -- dev = true,
  event = "BufReadPre *.dart",
  -- dependencies = "nvim-lua/plenary.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local flutter_tools = require "flutter-tools"
    flutter_tools.setup {
      ui = {
        notification_style = "native",
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true,
          background = false, -- highlight the background
          background_color = { r = 0, g = 0, b = 0 },
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = function()
          vim.cmd "highlight FlutterWidgetGuides ctermfg=9 guifg=grey"
        end,
        settings = {
          renameFilesWithClasses = "always",
          analysisExcludedFolders = {
            ".dart_tool",
            "/Users/lorenzo/.pub-cache/",
            "/Users/lorenzo/fvm/",
          },
          completeFunctionCalls = true,
          experimentalRefactors = true,
          allowOpenUri = true,
        },
      },
      debugger = {
        enabled = true,
        -- don't pause on exception in flutter
        exception_breakpoints = {},
        register_configurations = function(_)
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Mobile",
              cwd = "${workspaceFolder}",
              program = "${workspaceFolder}/lib/main.dart",
            },
            {
              type = "dart",
              request = "launch",
              name = "Web",
              device = "chrome",
              cwd = "${workspaceFolder}",
              program = "${workspaceFolder}/lib/main.dart",
              args = {
                "--web-port",
                "4200",
                "-d",
                "chrome",
              },
            },
          }
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = "15split", -- command to use to open the log buffer
        notify_errors = true,
        focus_on_open = false,
        filter = function(str)
          local patterns = {
            "^I/MESA",
            "^W/o.handyhelp.app",
            "^D/nativeloader",
            "^W/pool",
            "^D/CompatChangeReporter",
            "^D/TrafficStats",
            "^E/Surface",
            "^D/ProfileInstaller",
            "^W/WindowOnBackDispatcher",
          }
          for _, pattern in ipairs(patterns) do
            if str:match(pattern) then
              return false
            end
          end
          return true
        end,
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      decorations = {
        statusline = {
          project_config = true,
        },
      },
    }
    require("telescope").load_extension "flutter"
  end,
  cond = function()
    return not vim.g.vscode
  end,
  keys = {
    {
      "<leader>ffx",
      function()
        require("config.lsp.handlers").code_action_fix_all()
      end,
      desc = "Fix all",
    },
    {
      "<leader>ffs",
      "<cmd>FlutterSuper<cr>",
      desc = "Flutter super",
    },
    {
      "<leader>ffc",
      "<cmd>Telescope flutter commands<CR>",
      desc = "Commands list",
    },
    {
      "<leader>ffl",
      "<cmd>FlutterLogToggle<CR>",
      desc = "Toggle log",
    },
    {
      "<leader>ffe",
      "<cmd>FlutterEmulators<CR>",
      desc = "Emulators",
    },
    {
      "<leader>ffr",
      "<cmd>FlutterRestart<CR>",
      desc = "Restart",
    },
    {
      "<leader>ffB",
      "<cmd>TermExec cmd='fvm dart run build_runner build --delete-conflicting-outputs'<CR>",
      desc = "Run code generation",
    },
    {
      "<leader>ffw",
      "<cmd>TermExec cmd='fvm dart run build_runner watch'<CR>",
      desc = "Watch code generation",
    },
    -- {
    --   "<leader>fb",
    --   function()
    --     require("config.toggleterm").regenerate_single_directory()
    --   end,
    --   desc = "Reneration single directory",
    -- },
    {
      "<leader>ffg",
      "<cmd>FlutterPubGet<CR>",
      desc = "Flutter pub get",
    },
    {
      "<leader>ffq",
      "<cmd>FlutterQuit<CR>",
      desc = "Flutter quit",
    },
    {
      "<leader>fff",
      "<cmd>FlutterRun<CR>",
      desc = "Flutter run",
    },
    {
      "<leader>ffz",
      "<cmd>FlutterLogClear<CR>",
      desc = "Flutter log clear",
    },
    {
      "<leader>ffv",
      "<cmd>FlutterVisualDebug<CR>",
      desc = "Flutter visual debug",
    },
    {
      "<leader>ffD",
      "<cmd>FlutterDevices<CR>",
      desc = "Flutter devices",
    },
    -- {
    --   "<leader>ftb",
    --   function()
    --     require("config.dart_mason").list_bricks()
    --   end,
    --   desc = "List bricks",
    -- },
    -- {
    --   "<leader>fd",
    --   "<cmd>DBUIToggle<cr>",
    --   desc = "DBUI",
    -- },
    -- {
    --   "<leader>fo",
    --   function()
    --     require("config.pick_db").open_simulator_db_connection()
    --   end,
    --   desc = "Add simulator DB connection",
    -- },
    -- {
    --   "<leader>fu",
    --   "<cmd>PubspecAssistPickVersion<cr>",
    --   desc = "Pubspec assist pick version",
    -- },
  },
}

-- return {
--   "akinsho/flutter-tools.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "stevearc/dressing.nvim",
--   },
--   lazy = false,
--   config = true,
--   fvm = true,
--   decorations = {
--     statusline = {
--       -- Show app version from pubspec.yaml
--       app_version = true,
--       -- Show currently running device
--       device = true,
--       -- Project config
--       project_config = true,
--     },
--   },
--   lsp = {
--     settings = {
--       dart = {
--         lineLength = 120,
--       },
--     },
--   },
--   dev_tools = {
--     autostart = true, -- autostart devtools server if not detected
--     auto_open_browser = false, -- Automatically opens devtools in the browser
--   },
--   debugger = { -- integrate with nvim dap + install dart code debugger
--     -- make these two params true to enable debug mode
--     enabled = true,
--     run_via_dap = true,
--     -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
--     -- see |:help dap.set_exception_breakpoints()| for more info
--     exception_breakpoints = {},
--     -- Whether to call toString() on objects in debug views like hovers and the variables list.
--     -- Invoking toString() has a performance cost and may introduce side-effects,
--     -- although users may expected this functionality. null is treated like false.
--     evaluate_to_string_in_debug_views = true,
--     register_configurations = function(_)
--       -- Setup flutter integration into telescope
--       require("telescope").load_extension "flutter"
--
--       -- local map = vim.keymap.set
--       -- TODO add mappings
--
--       require("dap").configurations.dart = {
--         --put here config that you would find in .vscode/launch.json
--       }
--       -- If you want to load .vscode launch.json automatically run the following:
--       -- require("dap.ext.vscode").load_launchjs()
--     end,
--   },
--   fvm = true,
-- }
