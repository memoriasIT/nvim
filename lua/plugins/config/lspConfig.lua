return {
  "neovim/nvim-lspconfig",
  config = function()
    dofile(vim.g.base46_cache .. "lsp")

    local lspconfig = require "lspconfig"
    local glsp = require "configs.lspconfig"

    local servers = {
      bashls = {
        on_attach = function(client, bufnr)
          local filename = vim.api.nvim_buf_get_name(bufnr)
          if filename:match "%.env$" then
            vim.lsp.stop_client(client.id)
          end
        end,
      },
      jsonls = {},
      lua_ls = {
        settings = {
          Lua = {
            hint = { enable = true },
            telemetry = { enable = false },
            diagnostics = { globals = { "bit", "vim", "it", "describe", "before_each", "after_each" } },
            -- workspace libraries are set via lazydev
          },
        },
      },
    }

    local nvlsp = require "nvchad.configs.lspconfig"

    for name, opts in pairs(servers) do
      opts.on_init = glsp.on_init
      opts.on_attach = nvlsp.on_attach --glsp.generate_on_attach(opts.on_attach)
      opts.capabilities = glsp.capabilities
      lspconfig[name].setup(opts)
    end

    -- LSP UI
    local border = "rounded"
    local x = vim.diagnostic.severity
    vim.diagnostic.config {
      virtual_text = false,
      signs = { text = { [x.ERROR] = "", [x.WARN] = "", [x.INFO] = "", [x.HINT] = "󰌵" } },
      float = { border = border },
      underline = true,
      severity_sort = true,
    }

    -- Gutter
    vim.fn.sign_define("CodeActionSign", { text = "󰉁", texthl = "CodeActionSignHl" })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>d",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      { noremap = true, silent = true, desc = "[Code] See diagnostic error" }
    )
  end,
}
