return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end

        return {
          timeout = 500,
          lsp_format = "fallback",
        }
      end,
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { bang = true, desc = "Disable autoformat-on-save" })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Enable autoformat-on-save" })

      vim.keymap.set("n", "<leader>tf", function()
        if vim.b.disable_autoformat then
          vim.cmd "FormatEnable"
          vim.notify("Autoformat enabled (buffer)", vim.log.levels.INFO)
        else
          vim.cmd "FormatDisable!"
          vim.notify("Autoformat disabled (buffer)", vim.log.levels.WARN)
        end
      end, { desc = "Toggle autoformat (buffer)" })
    end,
  },
}
