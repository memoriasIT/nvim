-- https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/usercmds.lua
local create_cmd = vim.api.nvim_create_user_command
local utils = require "custom.utils"

create_cmd("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_enabled()
  if current_value then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = "Toggle diagnostics" })

-- TODO setup DAP
-- create_cmd("DapUIToggle", function()
--   require("dapui").toggle()
-- end, { desc = "Open DapUI" })

create_cmd("FormatToggle", function(args)
  local is_global = not args.bang
  if is_global then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    if vim.g.disable_autoformat then
      vim.notify("Format on save disabled", vim.log.levels.WARN)
    else
      vim.notify("Format on save enabled", vim.log.levels.INFO)
    end
  else
    vim.b.disable_autoformat = not vim.b.disable_autoformat
    if vim.b.disable_autoformat then
      vim.notify("Format on save disabled for this buffer", vim.log.levels.WARN)
    else
      vim.notify("Format on save enabled for this buffer", vim.log.levels.INFO)
    end
  end
end, {
  desc = "Toggle format on save",
  bang = true,
})

create_cmd("FormatFile", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format files via conform" })

create_cmd("FormatProject", function()
  local project_dir = vim.fn.getcwd()
  local lua_files = vim.fn.systemlist("find " .. project_dir .. ' -type f -name "*.lua"')
  for _, path in ipairs(lua_files) do
    utils.format_file(path)
  end
end, { desc = "Format project via conform" })
