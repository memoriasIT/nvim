local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local utils = require "custom.utils"
local buf_map = utils.buf_map

-- ┏┓   ┓
-- ┃ ┏┓┏┫┏┓
-- ┗┛┗┛┗┻┗
--     Code

--https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/autocmds.lua
autocmd({ "BufEnter", "FileType" }, {
  desc = "Prevent auto-comment on new line.",
  pattern = "*",
  group = augroup("NoNewLineComment", { clear = true }),
  command = [[
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  ]],
})

-- Plist files should be detected as XML
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.plist",
  command = "set filetype=xml",
})

-- ┳┓  ┏┏
-- ┣┫┓┏╋╋┏┓┏┓┏
-- ┻┛┗┻┛┛┗ ┛ ┛
--     Buffers

-- https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/autocmds.lua
autocmd("Filetype", {
  desc = "Prevent <Tab>/<S-Tab> from switching specific buffers.",
  pattern = {
    "lazy",
    "mason",
    "Neogit*",
    "qf",
  },
  group = augroup("PreventBufferSwap", { clear = true }),
  callback = function(event)
    local lhs_list = { "<Tab>", "<S-Tab>" }
    buf_map(event.buf, "n", lhs_list, "<nop>")
  end,
})

-- ┓ ┏•   ┓
-- ┃┃┃┓┏┓┏┫┏┓┓┏┏┏
-- ┗┻┛┗┛┗┗┻┗┛┗┻┛┛
-- Windows

-- TODO does not work with LazyGit
-- github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/autocmds.lua
-- autocmd("VimResized", {
--   desc = "Auto resize panes when resizing nvim window.",
--   pattern = "*",
--   group = augroup("VimAutoResize", { clear = true }),
--   command = [[ tabdo wincmd = ]],
-- })

autocmd("FileType", {
  desc = "Define windows to close with 'q'",
  pattern = {
    "empty",
    "gitsigns-blame",
    "help",
    "startuptime",
    "qf",
    "query",
    "lspinfo",
    "man",
    "checkhealth",
    "nvcheatsheet",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
  },
  group = augroup("WinCloseOnQDefinition", { clear = true }),
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    set nobuflisted
  ]],
})

-- ┳┓•          •
-- ┃┃┓┏┓┏┓┏┓┏┓┏╋┓┏┏
-- ┻┛┗┗┻┗┫┛┗┗┛┛┗┗┗┛
--       ┛ Diagnostics

local userDiagnosticGroup = augroup("UserDiagnostic", { clear = true })
-- https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/autocmds.lua
autocmd("ModeChanged", {
  desc = "Strategically disable diagnostics to focus on editing tasks.",
  pattern = { "n:i", "n:v", "i:v" },
  group = userDiagnosticGroup,
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/autocmds.lua
autocmd("ModeChanged", {
  desc = "Enable diagnostics upon exiting insert mode to resume feedback.",
  pattern = "i:n",
  group = userDiagnosticGroup,
  callback = function()
    vim.diagnostic.enable(true)
  end,
})
