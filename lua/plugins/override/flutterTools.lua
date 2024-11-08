return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  lazy = false,
  config = true,
  decorations = {
    statusline = {
      -- Show app version from pubspec.yaml
      app_version = true,
      -- Show currently running device
      device = true,
      -- Project config
      project_config = true,
    },
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    -- make these two params true to enable debug mode
    enabled = false,
    run_via_dap = false,
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    -- Whether to call toString() on objects in debug views like hovers and the variables list.
    -- Invoking toString() has a performance cost and may introduce side-effects,
    -- although users may expected this functionality. null is treated like false.
    evaluate_to_string_in_debug_views = true,
    register_configurations = function(_)
      require("dap").configurations.dart = {
        --put here config that you would find in .vscode/launch.json
      }
      -- If you want to load .vscode launch.json automatically run the following:
      -- require("dap.ext.vscode").load_launchjs()
    end,
  },
  fvm = true,
}
