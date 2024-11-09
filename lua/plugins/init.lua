return {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Overrides (from override folder)
  -- Add tabs indicator
  { import = "plugins.override.blankline" },

  -- Formatters for multiple languages
  { import = "plugins.override.conform" },

  -- DAP (Debug Adapter Protocol)
  { import = "plugins.override.dap" },

  -- Flutter
  { import = "plugins.override.flutterTools" }, -- Flutter run, tools, etc.
  { import = "plugins.override.dartVimPlugin" }, -- dart format and syntax
  -- TODO: Setup dap for flutter

  -- Git
  { import = "plugins.override.gitSigns" },

  -- File explorer
  { import = "plugins.override.nvimTree" },

  -- TreeSitter - Parse code to go around
  { import = "plugins.override.nvimTreeSitter" },

  -- Snacks - Quality of life addons
  { import = "plugins.override.snacks" },

  -- Telescope
  { import = "plugins.override.telescope" },

  -- Which Key
  { import = "plugins.override.whichKey" },
}
