-- Sorted alpahbetically
return {
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

  -- LSP config
  { import = "plugins.config.lspConfig" },

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

  -- Illuminate same words in the text
  { import = "plugins.config.vimIlluminate" },

  -- Which Key
  { import = "plugins.config.whichKey" },
}
