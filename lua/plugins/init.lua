return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      dofile(vim.g.base46_cache .. "lsp")

      local lspconfig = require "lspconfig"
      local glsp = require "configs.lspconfig"

      local servers = {
        dartls = {
          settings = {
            -- TODO does this work?
            lineLength = 120,
          },
        },
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
      }

      -- Gutter
      vim.fn.sign_define("CodeActionSign", { text = "󰉁", texthl = "CodeActionSignHl" })
    end,
  },

  -- configs (from override folder)
  -- Add tabs indicator
  { import = "plugins.config.blankline" },

  -- Navigate through camelCaseText
  { import = "plugins.config.camelCaseMotion" },

  -- Formatters for multiple languages
  { import = "plugins.config.conform" },

  -- DAP (Debug Adapter Protocol)
  { import = "plugins.config.dap" },

  -- Dashboard
  { import = "plugins.config.dashboard.dashboard" },

  -- Flutter
  { import = "plugins.config.flutter.flutterTools" }, -- Flutter run, tools, etc.
  { import = "plugins.config.flutter.dartVimPlugin" }, -- dart format and syntax
  -- TODO: Setup dap for flutter

  -- Harpoon - navigate between files/buffers/whatever
  { import = "plugins.config.harpoon" },

  -- Git
  { import = "plugins.config.gitSigns" },

  -- Illuminate same words in the text
  { import = "plugins.config.vimIlluminate" },

  -- Testing
  { import = "plugins.config.neotest" },

  -- File explorer
  { import = "plugins.config.nvimTree" },

  -- TreeSitter - Parse code to go around
  { import = "plugins.config.nvimTreeSitter" },

  -- Undotree - see changes and go back to old ones
  { import = "plugins.config.undoTree" },

  -- Persistence - Save sessions for next time
  { import = "plugins.config.persistence" },

  -- Raimbow brackets/parenthesis
  { import = "plugins.config.raimbowDelimiters" },

  -- Snacks - Quality of life addons
  { import = "plugins.config.snacks" },

  -- Trouble - lint fixes etc.
  { import = "plugins.config.trouble" },

  -- To dos
  { import = "plugins.config.todo" },

  -- Telescope
  { import = "plugins.config.telescope" },

  -- Which Key
  { import = "plugins.config.whichKey" },
}
