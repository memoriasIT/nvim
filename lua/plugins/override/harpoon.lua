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
    end, { desc = "Add to harpoon" })

    map("n", "<C-S-A>", function()
      harpoon:list():remove()
    end, { desc = "Remove from harpoon" })

    map("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Previous Harpooned buffer" })

    map("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Next Harpooned buffer" })

    map("n", "<C-e>", function()
      toggle_telescope(harpoon:list(), conf)
    end, { desc = "Open harpoon window" })

    -- local utils = require "custom.utils"
    -- local harpoon = require "harpoon"
    --
    -- harpoon:setup {}
    --
    -- map("n", "<A-q>", function()
    --   harpoon:list():select(1)
    -- end, { desc = "Harpoon Go to 1st buffer" })
    -- map("n", "<A-w>", function()
    --   harpoon:list():select(2)
    -- end, { desc = "Harpoon Go to 2nd buffer" })
    -- map("n", "<A-e>", function()
    --   harpoon:list():select(3)
    -- end, { desc = "Harpoon Go to 3rd buffer" })
    -- map("n", "<A-r>", function()
    --   harpoon:list():select(4)
    -- end, { desc = "Harpoon Go to 4th buffer" })
    -- map("n", "<A-t>", function()
    --   harpoon:list():select(5)
    -- end, { desc = "Harpoon Go to 5th buffer" })
    -- map("n", "<A-y>", function()
    --   harpoon:list():select(6)
    -- end, { desc = "Harpoon Go to 6th buffer" })
    -- map("n", "<A-a>", function()
    --   harpoon:list():add()
    -- end, { desc = "Harpoon Add buffer" })

    -- end, { desc = "Harpoon Remove buffer" })
    -- map("n", "<A-m>", utils.harpoon_menu, { desc = "Harpoon Open menu" })
    -- map("n", "<A-,>", function()
    --   harpoon:list():prev()
    -- end, { desc = "Harpoon Go to prev buffer" })
    -- map("n", "<A-.>", function()
    --   harpoon:list():next()
    -- end, { desc = "Harpoon Go to next buffer" })
    --
    -- vim.cmd [[ command! RunHarpoon lua require("custom.utils").harpoon_menu() ]]
  end,
}
