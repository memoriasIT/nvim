-- return {
--   "mfussenegger/nvim-dap",
--   ft = { "dart" }, -- Only load for Dart files
--   config = function()
--     local dap = require "dap"
--
--     dap.adapters.dart = {
--       type = "executable",
--       command = "dart",
--       args = { "debug_adapter" },
--     }
--
--     dap.configurations.dart = {
--       {
--         type = "dart",
--         request = "launch",
--         name = "Launch Dart Program",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--         args = { "--help" },
--       },
--     }
--   end,
-- }

return {
  "mfussenegger/nvim-dap",
  dependencies = { "theHamsta/nvim-dap-virtual-text" },
  event = "VeryLazy",
  config = function()
    require("nvim-dap-virtual-text").setup {}
    vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "debugBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "debugBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "debugBreakpoint",
      linehl = "debugPC",
      numhl = "",
    })
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end)
    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over {}
    end)
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into {}
    end)
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out {}
    end)
  end,
}
