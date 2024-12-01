---@diagnostic disable: different-requires

---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  init = function()
    -- <leader>fm -> Format file
    vim.keymap.set("n", "<leader>fm", function()
      require("conform").format { lsp_fallback = true }
    end, { desc = "[Code] General format file" })

    -- Disable formatting with "FormatDisable"
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    -- Enable formatting with "FormatEnable"
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      bash = { "shfmt" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "biome" },
      markdown = { "markdownlint" },
      python = { "ruff_format" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      toml = { "taplo" },
      yaml = { "yamlfmt" },
      yml = { "yamlfmt" },
      ruby = { "rubocop" },
      fastfile = { "rubocop" },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat on dart (it uses it's own format)
      local ignore_filetypes = { "dart" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end

      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 1000, lsp_fallback = true }
    end,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
    formatters = {
      yamlfmt = {
        args = { "-formatter", "retain_line_breaks_single=true" },
      },
    },
  },
}
