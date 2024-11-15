require "nvchad.options"
local opt = vim.opt

opt.relativenumber = true

-- Access system clipboard
opt.clipboard = "unnamedplus"

-- Don't wrap lines
vim.wo.wrap = false

-- Wrap around lines not with hl
vim.opt.whichwrap = "<>[]l,b,s"
