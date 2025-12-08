return {
  {
    "folke/snacks.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    priority = 1000,
    opts = {
      explorer = { enabled = true, replace_netrw = true },
      bigfile = {
        enabled = true,
        notify = false,
        size = 1024 * 1024,
        setup = function(ctx)
          vim.cmd "syntax clear"
          vim.opt_local.syntax = "OFF"

          local buffer = vim.b[ctx.buf]
          if buffer.ts_highlight then
            vim.treesitter.stop(ctx.buf)
          end
        end,
      },
      picker = { enabled = true },
      indent = {
        enabled = true,
        only_scope = true,
        only_current = true,
      },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      scratch = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          _G.dd = function(...) require("snacks").debug.inspect(...) end

          if vim.fn.has "nvim-0.11" == 1 then
            vim._print = function(_, ...) dd(...) end
          else
            vim.print = _G.dd
          end

          require("snacks").toggle.option("spell", { name = "Spelling" }):map "<leader>us"
          require("snacks").toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
          require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
          require("snacks").toggle.inlay_hints():map "<leader>uh"
        end,
      })
    end,
  },
}
