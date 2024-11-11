require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local alias = require("custom.utils").add_alias

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move window right" })

-- buffer go next and prev
map("n", "bh", ":bprev<CR>", { desc = "Go to prev buffer" })
map("n", "bl", ":bnext<CR>", { desc = "Go to next buffer" })

-- Workarounds for my dumb fingers
-- Credits to https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/aliases.lua
alias("qa", "Qa")
alias("qa", "QA")
alias("q", "Q")
alias("w", "W")
