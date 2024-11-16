-- {
--   "nvim-neotest/neotest",
--   dependencies = {
--     "nvim-neotest/nvim-nio",
--     "nvim-lua/plenary.nvim",
--     "nvim-neotest/neotest-plenary",
--     "antoinemadec/FixCursorHold.nvim",
--     "nvim-treesitter/nvim-treesitter",
-- 'sidlatau/neotest-dart',
--   },
--     lazy = false,
--      keys = {
--       {"<leader>t", "", desc = "+test"},
--       { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File (Neotest)" },
--       { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files (Neotest)" },
--       { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest (Neotest)" },
--       { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last (Neotest)" },
--       { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary (Neotest)" },
--       { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
--       { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel (Neotest)" },
--       { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop (Neotest)" },
--       { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
--     },
--     config = function()
--     require('neotest').setup({
--         discovery = { enabled = true },
--         diagnostic = { enabled = true },
--         quickfix = { enabled = false, open = true },
--       adapters = {
--           require("neotest-plenary"),
--         require('neotest-dart') {
--              command = 'fvm flutter',
--              use_lsp = true,
--              -- Useful when using custom test names with @isTest annotation
--              custom_test_method_names = {},
--       }
--     }})
--   end
-- },

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sidlatau/neotest-dart",
  },
  lazy = false,
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-dart" {
          command = "fvm flutter",
          custom_test_method_names = { "blocTest" },
        },
        require "neotest-plenary",
      },
      output = {
        open_on_run = true,
      },
      discovery = {
        enabled = true,
      },
      diagnostic = {
        enabled = true,
      },
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.8,
        options = {},
      },
      quickfix = {
        enabled = false,
      },
      state = {
        enabled = true,
      },
      keys = {
        { "<leader>t", "", desc = "+test" },
        {
          "<leader>tt",
          function()
            require("neotest").run.run(vim.fn.expand "%")
          end,
          desc = "Run File (Neotest)",
        },
        {
          "<leader>tT",
          function()
            require("neotest").run.run(vim.uv.cwd())
          end,
          desc = "Run All Test Files (Neotest)",
        },
        {
          "<leader>tr",
          function()
            require("neotest").run.run()
          end,
          desc = "Run Nearest (Neotest)",
        },
        {
          "<leader>tl",
          function()
            require("neotest").run.run_last()
          end,
          desc = "Run Last (Neotest)",
        },
        {
          "<leader>ts",
          function()
            require("neotest").summary.toggle()
          end,
          desc = "Toggle Summary (Neotest)",
        },
        {
          "<leader>to",
          function()
            require("neotest").output.open { enter = true, auto_close = true }
          end,
          desc = "Show Output (Neotest)",
        },
        {
          "<leader>tO",
          function()
            require("neotest").output_panel.toggle()
          end,
          desc = "Toggle Output Panel (Neotest)",
        },
        {
          "<leader>tS",
          function()
            require("neotest").run.stop()
          end,
          desc = "Stop (Neotest)",
        },
        {
          "<leader>tw",
          function()
            require("neotest").watch.toggle(vim.fn.expand "%")
          end,
          desc = "Toggle Watch (Neotest)",
        },
      },
    }
  end,
}