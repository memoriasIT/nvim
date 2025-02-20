---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- TODO This seems to be expensive for dart files at least. It provides cool
    -- possible mappings like select around class, but I don't think it's worth it
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    -- "nvim-treesitter/playground",
  },
  opts = {
    ensure_installed = {
      "dart",
      "bash",
      "c",
      "css",
      "html",
      "http",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "xml",
    },
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>is",
        node_incremental = "<Tab>",
        scope_incremental = "<S-s>",
        node_decremental = "<S-Tab>",
      },
    },
    -- TODO commented due to performance issues
    -- textobjects = {
    --   select = {
    --     enable = true,
    --     lookahead = true,
    --     keymaps = {
    --       ["af"] = { query = "@function.outer", desc = "Select around function" },
    --       ["if"] = { query = "@function.inner", desc = "Select inner part of function" },
    --       ["ac"] = { query = "@class.outer", desc = "Select around class" },
    --       ["ic"] = { query = "@class.inner", desc = "Select inner part of class" },
    --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    --     },
    --      selection_modes = {
    --        ["@parameter.outer"] = "v",
    --        ["@function.outer"] = "V",
    --        ["@class.outer"] = "<c-v>",
    --      },
    --     },
    --     swap = {
    --      enable = true,
    --      swap_next = {
    --        ["<leader>wn"] = "@parameter.inner",
    --      },
    --      swap_previous = {
    --        ["<leader>wp"] = "@parameter.inner",
    --      },
    --   },
    -- },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  },
}
