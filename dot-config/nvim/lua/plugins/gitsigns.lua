return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gs = require "gitsigns"

        local function keymap(mode, l, r, desc, opts)
          opts = {} or opts
          opts.buffer = bufnr
          opts.desc = desc
          vim.keymap.set(mode, l, r, opts)
        end

        local keybinds = {
          {
            "n",
            "]c",
            function()
              if vim.wo.diff then
                vim.cmd.normal { "]c", bang = true }
              else
                gs.nav_chunk "next"
              end
            end,
            "Git: Next Hunk",
          },
          {
            "n",
            "[c",
            function()
              if vim.wo.diff then
                vim.cmd.normal { "[c", bang = true }
              else
                gs.nav_chunk "prev"
              end
            end,
            "Git: Prev Hunk",
          },
          {
            "n",
            "<leader>ghs",
            gs.stage_hunk,
            "Git: Stage Hunk",
          },
          {
            "v",
            "<leader>ghs",
            function() gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end,
            "Git: Stage Hunk",
          },
          {
            "n",
            "<leader>ghS",
            gs.stage_buffer,
            "Git: Stage Buffer",
          },
          {
            "n",
            "<leader>ghr",
            gs.reset_hunk,
            "Git: Reset Hunk",
          },
          {
            "v",
            "<leader>ghr",
            function() gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end,
            "Git: Reset Hunk",
          },
          {
            "n",
            "<leader>ghR",
            gs.reset_buffer,
            "Git: Reset Buffer",
          },
          {
            "n",
            "<leader>ghp",
            gs.preview_hunk,
            "Git: Preview Hunk",
          },
          {
            "n",
            "<leader>gb",
            function() gs.blame_line { full = true } end,
            "Git: Blame Line",
          },
          {
            "n",
            "<leader>gd",
            gs.diffthis,
            "Git: Diff Against Index",
          },
          {
            "n",
            "<leader>gD",
            function() gs.diffthis "~" end,
            "Git: Diff Against Previous Commit",
          },
          {
            "n",
            "<leader>gq",
            gs.setqflist,
            "Git: Send Hunk to Quickfix List",
          },
          {
            "n",
            "<leader>gQ",
            function() gs.setqflist "all" end,
            "Git: Send All Hunks to Quickfix List",
          },
          {
            "n",
            "<leader>gtb",
            gs.toggle_current_line_blame,
            "Git: Toggle Git Blame on Current Line",
          },
          {
            "n",
            "<leader>gtw",
            gs.toggle_word_diff,
            "Git: Toggle Word Diff",
          },
          {
            { "o", "x" },
            "ih",
            gs.select_hunk,
            "Git: Select Hunk",
          },
        }

        for _, keybind in ipairs(keybinds) do
          keymap(unpack(keybind))
        end
      end,
    }
  end,
}
