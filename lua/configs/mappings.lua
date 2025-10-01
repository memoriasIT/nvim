require "nvchad.mappings"

local map = vim.keymap.set
local set_keymap = vim.api.nvim_set_keymap
local alias = require("custom.utils").add_alias

-- ┓ ┏•   ┓
-- ┃┃┃┓┏┓┏┫┏┓┓┏┏  ┏┳┓┏┓┏┓┏┓┏┓┏┓┏┳┓┏┓┏┓╋
-- ┗┻┛┗┛┗┗┻┗┛┗┻┛  ┛┗┗┗┻┛┗┗┻┗┫┗ ┛┗┗┗ ┛┗┗
-- WINDOW MANAGEMENT        ┛

-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<CR>", { desc = "[Window] Resize window up +2" })
map("n", "<S-Down>", "<cmd>resize -2<CR>", { desc = "[Window] Resize window down -2" })
map("n", "<S-Left>", "<cmd>vertical resize +2<CR>", { desc = "[Window] Resize window left +2" })
map("n", "<S-Right>", "<cmd>vertical resize -2<CR>", { desc = "[Window] Resize window right -2" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "[Window] Move window left" })
map("n", "<C-j>", "<C-w>j", { desc = "[Window] Move window down" })
map("n", "<C-k>", "<C-w>k", { desc = "[Window] Move window up" })
map("n", "<C-l>", "<C-w>l", { desc = "[Window] Move window right" })

-- ┳┳┓   •
-- ┃┃┃┏┓╋┓┏┓┏┓┏
-- ┛ ┗┗┛┗┗┗┛┛┗┛
-- MOTIONS

-- Scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "[Motions] Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "[Motions] Scroll up and center" })

-- ┏┓┓•  ┓        ┓
-- ┃ ┃┓┏┓┣┓┏┓┏┓┏┓┏┫
-- ┗┛┗┗┣┛┗┛┗┛┗┻┛ ┗┻
--     ┛  CLIPBOARD

-- Use <leader>+C and <leader>+V to copy/paste to the system clipboard
-- Enable clipboard support if it's not already enabled
vim.opt.clipboard = "unnamedplus"
map("v", "<leader>c", '"+y', { desc = "[Clipboard] Copy to system clipboard" })
map("n", "<leader>v", '"+p', { desc = "[Clipboard] Paste from system clipboard" })
map("v", "<leader>v", '"+p', { desc = "[Clipboard] Paste from system clipboard" })

-- Paste over currently selected text without yanking it
map("v", "p", '"_dp')

-- ┏┓    ┓•       ┏  ┓ •┏
-- ┃┃┓┏┏┓┃┓╋┓┏  ┏┓╋  ┃ ┓╋┏┓
-- ┗┻┗┻┗┻┗┗┗┗┫  ┗┛┛  ┗┛┗┛┗
-- Quality   ┛   of    Life

-- Enter command with ; (dumb fingers-proof)
map("n", ";", ":", { desc = "[QoL] CMD enter command mode" })

-- Go to (N)ormal mode from (I)nsert with jk
-- map("i", "jk", "<ESC>", { desc = "[QoL] Go to normal mode with jk" })

-- Redo the last executed command with <leader>rd
set_keymap("n", "<leader>rd", ":@:<CR>", { desc = "[QoL] Re-execute last command" })

-- Workarounds for my dumb fingers
-- Credits to https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/aliases.lua
alias("qa", "Qa")
alias("qa", "QA")
alias("q", "Q")
alias("w", "W")

-- ┏┓   ┓
-- ┃ ┏┓┏┫┏┓
-- ┗┛┗┛┗┻┗
--     C0d3

-- Better indent
map("v", "<", "<gv", { desc = "[Code] Indent left" })
map("v", ">", ">gv", { desc = "[Code] Indent right" })

map("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "[LSP] Go to implementation" })
map("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[LSP] Go to declaration" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "[LSP] Show signature help" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[LSP] Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[LSP] Remove workspace folder" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "[LSP] Show references" })
map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "[LSP] Go to type definition" })

map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[LSP] list workspace folders" })

map(
  "x",
  "<leader>ca",
  "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
  { noremap = true, silent = true, desc = "[LSP] Open code actions" }
)

map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "[LSP] See info on hover" })

map("n", "<leader>ra", function()
  require "nvchad.lsp.renamer"()
end, { desc = "[LSP] Rename" })
