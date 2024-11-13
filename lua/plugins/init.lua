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

  -- Navigate through camelCaseText
  { import = "plugins.override.camelCaseMotion" },

  -- Formatters for multiple languages
  { import = "plugins.override.conform" },

  -- DAP (Debug Adapter Protocol)
  { import = "plugins.override.dap" },

  -- Flutter
  { import = "plugins.override.flutterTools" }, -- Flutter run, tools, etc.
  { import = "plugins.override.dartVimPlugin" }, -- dart format and syntax
  -- TODO: Setup dap for flutter

  -- Harpoon - navigate between files/buffers/whatever
  { import = "plugins.override.harpoon" },

  -- Git
  { import = "plugins.override.gitSigns" },

  -- Illuminate same words in the text
  { import = "plugins.override.vimIlluminate" },

  -- Testing
  { import = "plugins.override.neotest" },

  -- File explorer
  { import = "plugins.override.nvimTree" },

  -- TreeSitter - Parse code to go around
  { import = "plugins.override.nvimTreeSitter" },

  -- Undotree - see changes and go back to old ones
  { import = "plugins.override.undoTree" },

  -- Persistence - Save sessions for next time
  { import = "plugins.override.persistence" },

  -- Raimbow brackets/parenthesis
  { import = "plugins.override.raimbowDelimiters" },

  -- Snacks - Quality of life addons
  { import = "plugins.override.snacks" },

  -- Trouble - lint fixes etc.
  { import = "plugins.override.trouble" },

  -- To dos
  { import = "plugins.override.todo" },

  -- Telescope
  { import = "plugins.override.telescope" },

  -- Which Key
  { import = "plugins.override.whichKey" },
}
