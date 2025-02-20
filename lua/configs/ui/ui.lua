-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local statusline = require "configs.ui.statusline"

M.base46 = {
  theme = "onenord",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    separator_style = "arrow",
    modules = {
      lsp = statusline.lsp(),
    },
  },
}

return M
