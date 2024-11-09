-- Yanked from https://github.com/lllttt06/dotfiles/blob/main/nvim/lua/core/image.lua
local M = {}

local function getEntryAbsolutePath()
  local api = require "nvim-tree.api"
  local node = api.tree.get_node_under_cursor()
  if not node then
    return
  end
  local dir = node.absolute_path
  local entry = node.name
  return dir, entry
end

function M.openWithQuickLook()
  local dir, entry = getEntryAbsolutePath()
  if dir and entry then
    local path = ("%s/%s"):format(dir, entry)
    vim.notify("Path: " .. path, nil, {
      title = "Neovim",
      timeout = 5000,
    })

    vim.cmd(("silent !qlmanage -p %s &"):format(dir))
  else
    vim.notify("No valid node selected", nil, {
      title = "Neovim",
      timeout = 5000,
    })
  end
end

return M
