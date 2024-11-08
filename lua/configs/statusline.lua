-- Import necessary modules
--local config = require("nvconfig").ui.statusline
--local sep_style = config.separator_style
local utils = require "nvchad.stl.utils"

-- Set up separator icons
--local sep_icons = utils.separators
--local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]
--local sep_l = separators["left"]
--local sep_r = separators["right"]

local M = {}

-- Mode function
--M.mode = function()
--  if not utils.is_activewin() then
--    return ""
--  end
--
--  local modes = utils.modes
--  local m = vim.api.nvim_get_mode().mode
--  local current_mode = "%#St_" .. modes[m][2] .. "Mode#  " .. modes[m][1]
--  local mode_sep1 = "%#St_" .. modes[m][2] .. "ModeSep#" .. sep_r
--  return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
--end
--
---- File function
--M.file = function()
--  local x = utils.file()
--  local name = " " .. x[2] .. " "
--  return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r
--end
--
---- Git function
--M.git = function()
--  return "%#St_gitIcons#" .. utils.git()
--end
--
---- LSP message function
--M.lsp_msg = function()
--  return "%#St_LspMsg#" .. utils.lsp_msg()
--end
--
---- Diagnostics function
--M.diagnostics = utils.diagnostics
--
---- LSP function
M.lsp = function()
  return "%#St_Lsp#" .. utils.lsp() .. M.flutter_app_version() .. " "
end
--
---- Flutter App Version function
M.flutter_app_version = function()
  local app_version = vim.g.flutter_tools_decorations and vim.g.flutter_tools_decorations.app_version
  return app_version or "[No Version]" -- Fallback if app_version is not set
end
--
---- CWD function
--M.cwd = function()
--  local icon = "%#St_cwd_icon#" .. "󰉋 "
--  local name = vim.uv.cwd()
--  name = "%#St_cwd_text#" .. " " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
--  return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. icon .. name)) or ""
--end
--
---- Cursor position
--M.cursor = function()
--  return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %p %% "
--end

-- Export the individual components as a module
return M
