-- Inspired by https://github.com/mgastonportillo/nvchad-config/blob/main/lua/gale/lsp.lua
---@alias OnAttach fun(client: vim.lsp.Client, bufnr: integer)
---@alias OnInit fun(client: vim.lsp.Client, initialize_result: lsp.InitializeResult)

---@type OnAttach
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, opts)
    local options = { buffer = bufnr }
    if opts then
      options = vim.tbl_deep_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
  map("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
  map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP show signature help" })
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "LSP add workspace folder" })
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP remove workspace folder" })
  map("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP show references" })
  map("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "LSP go to type definition" })

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "LSP list workspace folders" })

  map(
    "x",
    "<leader>ca",
    "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, desc = "Open code actions" }
  )

  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "See info on hover" })

  map("n", "<leader>ra", function()
    require "nvchad.lsp.renamer"()
  end, { desc = "LSP rename" })
end

---@type OnInit
local on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
