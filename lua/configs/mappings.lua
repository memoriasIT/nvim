require "nvchad.mappings"

local map = vim.keymap.set
local alias = require("custom.utils").add_alias

-- ┓ ┏•   ┓                            
-- ┃┃┃┓┏┓┏┫┏┓┓┏┏  ┏┳┓┏┓┏┓┏┓┏┓┏┓┏┳┓┏┓┏┓╋
-- ┗┻┛┗┛┗┗┻┗┛┗┻┛  ┛┗┗┗┻┛┗┗┻┗┫┗ ┛┗┗┗ ┛┗┗
-- WINDOW MANAGEMENT        ┛

-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>")
map("n", "<S-Down>", "<cmd>resize -2<CR>")
map("n", "<S-Left>", "<cmd>vertical resize +2<CR>")
map("n", "<S-Right>", "<cmd>vertical resize -2<CR>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move window right" })


-- ┳┳┓   •     
-- ┃┃┃┏┓╋┓┏┓┏┓┏
-- ┛ ┗┗┛┗┗┗┛┛┗┛
-- MOTIONS

-- Scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })


-- ┏┓┓•  ┓        ┓
-- ┃ ┃┓┏┓┣┓┏┓┏┓┏┓┏┫
-- ┗┛┗┗┣┛┗┛┗┛┗┻┛ ┗┻
--     ┛  CLIPBOARD

-- Use <leader>+C and <leader>+V to copy/paste to the system clipboard
-- Enable clipboard support if it's not already enabled
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("v", "<leader>c", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>v", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>v", '"+p', { desc = "Paste from system clipboard" })

-- Paste over currently selected text without yanking it
map("v", "p", '"_dp')


-- ┏┓    ┓•       ┏  ┓ •┏  
-- ┃┃┓┏┏┓┃┓╋┓┏  ┏┓╋  ┃ ┓╋┏┓
-- ┗┻┗┻┗┻┗┗┗┗┫  ┗┛┛  ┗┛┗┛┗ 
-- Quality   ┛   of    Life                      


-- Enter command with ; (dumb fingers-proof)
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Go to (N)ormal mode from (I)nsert with jk
map("i", "jk", "<ESC>")


-- Workarounds for my dumb fingers
-- Credits to https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/aliases.lua
alias("qa", "Qa")
alias("qa", "QA")
alias("q", "Q")
alias("w", "W")

-- Better indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

