require "nvchad.options"
local opt = vim.opt

opt.relativenumber = true

-- Access system clipboard
opt.clipboard = "unnamedplus"

-- Conform format on save is disabled as default
-- It clashes with flutter settings and does not take the line length into account
-- TODO Add settings on conform to add the line length 120 for dart or disable conform for dart
vim.b.disable_autoformat = true
vim.g.disable_autoformat = true
