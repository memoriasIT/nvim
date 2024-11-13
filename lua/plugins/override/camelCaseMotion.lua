return {
"bkad/CamelCaseMotion",
  lazy = false,
  config = function()
    vim.g.camelcasemotion_key = "["
    -- Set up CamelCaseMotion key mappings
    vim.api.nvim_set_keymap("n", "[w", "<Plug>CamelCaseMotion_w", { silent = true })
    vim.api.nvim_set_keymap("n", "[b", "<Plug>CamelCaseMotion_b", { silent = true })
    vim.api.nvim_set_keymap("n", "[e", "<Plug>CamelCaseMotion_e", { silent = true })

    vim.api.nvim_set_keymap("x", "[w", "<Plug>CamelCaseMotion_w", { silent = true })
    vim.api.nvim_set_keymap("x", "[b", "<Plug>CamelCaseMotion_b", { silent = true })
    vim.api.nvim_set_keymap("x", "[e", "<Plug>CamelCaseMotion_e", { silent = true })

    vim.api.nvim_set_keymap("o", "[w", "<Plug>CamelCaseMotion_w", { silent = true })
    vim.api.nvim_set_keymap("o", "[b", "<Plug>CamelCaseMotion_b", { silent = true })
    vim.api.nvim_set_keymap("o", "[e", "<Plug>CamelCaseMotion_e", { silent = true })
  end,

}
