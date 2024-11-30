local function toggle_telescope(harpoon_files, conf)
  local finder = function()
    local paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(paths, item.value)
    end

    return require("telescope.finders").new_table {
      results = paths,
    }
  end
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = finder(),
      previewer = conf.file_previewer {},
      sorter = require("telescope.config").values.generic_sorter {},
      layout_config = {
        height = 0.4,
        width = 0.5,
        prompt_position = "top",
        preview_cutoff = 120,
      },
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<C-d>", function()
          local state = require "telescope.actions.state"
          local selected_entry = state.get_selected_entry()
          local current_picker = state.get_current_picker(prompt_bufnr)

          table.remove(harpoon_files.items, selected_entry.index)
          current_picker:refresh(finder())
        end)
        return true
      end,
    })
    :find()
end

---@type NvPluginSpec
return {
  "ThePrimeagen/harpoon",
  event = "BufEnter",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {}

    local conf = require("telescope.config").values
    local map = vim.keymap.set

    map("n", "<C-A>", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon", group = "Harpoon" })

    map("n", "<C-S-A>", function()
      harpoon:list():remove()
    end, { desc = "Remove from harpoon", group = "Harpoon" })

    map("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Previous Harpooned buffer", group = "Harpoon" })

    map("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Next Harpooned buffer", group = "Harpoon" })

    map("n", "<C-e>", function()
      toggle_telescope(harpoon:list(), conf)
    end, { desc = "Open harpoon window", group = "Harpoon" })
  end,
}
