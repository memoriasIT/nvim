return {
  "rcarriga/nvim-dap-ui",
  requires = { "mfussenegger/nvim-dap" },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle DAP UI",
    },
  },
  config = function()
    local dap, dapui = require "dap", require "dapui"
    dapui.setup()
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}

-- return {
--   "rcarriga/nvim-dap-ui",
--   dependencies = { "mfussenegger/nvim-dap" },
--   config = function()
--     local dap, dapui = require "dap", require "dapui"
--
--     -- Setup nvim-dap-ui
--     dapui.setup {
--       icons = { expanded = "▾", collapsed = "▸" },
--       mappings = {
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         edit = "e",
--         repl = "r",
--         toggle = "t",
--       },
--       layouts = {
--         {
--           elements = {
--             "scopes",
--             "breakpoints",
--             "stacks",
--             "watches",
--           },
--           size = 40,
--           position = "left",
--         },
--         {
--           elements = {
--             "repl",
--             "console",
--           },
--           size = 10,
--           position = "bottom",
--         },
--       },
--       floating = {
--         max_height = nil,
--         max_width = nil,
--         border = "single",
--         mappings = {
--           close = { "q", "<Esc>" },
--         },
--       },
--       windows = { indent = 1 },
--     }
--
--     -- -- Keybindings for debugging
--     -- vim.api.nvim_set_keymap("n", "<F5>", '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
--     -- vim.api.nvim_set_keymap("n", "<F10>", '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
--     -- vim.api.nvim_set_keymap("n", "<F11>", '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
--     -- vim.api.nvim_set_keymap("n", "<F12>", '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
--     -- vim.api.nvim_set_keymap(
--     --   "n",
--     --   "<Leader>b",
--     --   '<Cmd>lua require"dap".toggle_breakpoint()<CR>',
--     --   { noremap = true, silent = true }
--     -- )
--     -- vim.api.nvim_set_keymap(
--     --   "n",
--     --   "<Leader>B",
--     --   '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
--     --   { noremap = true, silent = true }
--     -- )
--     -- vim.api.nvim_set_keymap(
--     --   "n",
--     --   "<Leader>lp",
--     --   '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
--     --   { noremap = true, silent = true }
--     -- )
--     -- vim.api.nvim_set_keymap(
--     --   "n",
--     --   "<Leader>dr",
--     --   '<Cmd>lua require"dap".repl.open()<CR>',
--     --   { noremap = true, silent = true }
--     -- )
--     -- vim.api.nvim_set_keymap(
--     --   "n",
--     --   "<Leader>dl",
--     --   '<Cmd>lua require"dap".run_last()<CR>',
--     --   { noremap = true, silent = true }
--     -- )
--
--     -- Automatically open/close DAP UI when debugging starts/stops
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited["dapui_config"] = function()
--       dapui.close()
--     end
--   end,
-- }
