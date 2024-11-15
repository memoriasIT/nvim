vim.g.dart_format_on_save = true
vim.g.dartfmt_options = { "--line-length=120" }

return {
  {
    "dart-lang/dart-vim-plugin",
    lazy = false,
  },
}
