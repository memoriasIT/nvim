-- For some reason the option to format on save given bellow is not working
-- If it's set like this it will be fine
vim.g.dart_format_on_save = true

return {
  {
    "dart-lang/dart-vim-plugin",
    lazy = false,
    opt = {
      dart_format_on_save = true,
    },
  },
}
