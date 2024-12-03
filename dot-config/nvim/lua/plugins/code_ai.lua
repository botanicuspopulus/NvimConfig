return {
  "Exafunction/codeium.nvim",
  event = "User AstroFile",
  cmd = "Codeium",
  opts = {
    enable_chat = true,
    virtual_text = {
      enabled = true,
      manual = false,
      filetypes = {},
      default_filetype_enabled = true,
      idle_delay = 75,
      virtual_text_priority = 65535,
      map_keys = true,
      accept_fallback = nil,
        accept = "<M-a>",
        accept_word = "<M-f>",
      key_bindings = {
        accept_line = false,
        clear = false,
        next = "<M-]>",
        prev = "<M-[>",
      }
    }
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "AstroNvim/astroui" ,
      opts = {
        icons = {
          Codeium = " ",
        },
      },
    },
    { "AstroNvim/astrocore",
      opts = function(_, opts)
        return require("astrocore").extend_tbl(opts, {
          mappings = {
            n = {
              ["<Leader>;"] = {
                desc = require("astroui").get_icon("Codeium", 1, true) .. "Codeium",
              },
              ["<Leader>;o"] = {
                desc = "Open Chat",
                function() vim.cmd "Codeium Chat" end,
              },
            },
          },
        })
      end,
    },
  },
}
