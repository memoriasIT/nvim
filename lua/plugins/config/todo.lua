---@type NvPluginSpec
return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  event = "VeryLazy",
  config = function()
    -- TODO cache is not working
    -- dofile(vim.g.base46_cache .. "todo")
    require("todo-comments").setup {
      keywords = {
        -- TODO for some reason these are not taking into account
        GROUP = { icon = " ", color = "hint" },
        HERE = { icon = " ", color = "here" },
      },
      colors = { here = "#fdf5a4" },
      highlight = { multiline = true },
    }
  end,
}
