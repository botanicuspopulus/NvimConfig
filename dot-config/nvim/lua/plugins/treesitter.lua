return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup {
        install_dir = vim.fn.stdpath "data" .. "/treesitter",
      }

      require("nvim-treesitter").install {
        "bash",
        "diff",
        "html",
        "printf",
        "regex",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "c",
        "cpp",
        "cuda",
        "cmake",
        "dockerfile",
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
        "json5",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "rst",
        "toml",
        "ninja",
        "bibtex",
        "latex",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "tsx",
        "typescript",
      }

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
        callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    branch = "main",
    opts = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        keys = {
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("nvim_treesitter_textobjects", { clear = true }),
        callback = function(ev)
          local moves = vim.tbl_get(opts, "move", "keys") or {}

          for method, keymaps in pairs(moves) do
            for key, query in pairs(keymaps) do
              local desc = query:gsub("@", ""):gsub("%..*", "")
              desc = desc:sub(1, 1):upper() .. desc:sub(2)
              desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
              desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")

              if not (vim.wo.diff and key:find "[cC]") then
                vim.keymap.set(
                  { "n", "x", "o" },
                  key,
                  function() require("nvim-treesitter-textobjects.move")[method](query, "textobjects") end,
                  {
                    buffer = ev.buf,
                    desc = desc,
                    silent = true,
                  }
                )
              end
            end
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter",
    config = function()
      require("treesitter-context").setup {
        enable = true,
        multiwindow = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
