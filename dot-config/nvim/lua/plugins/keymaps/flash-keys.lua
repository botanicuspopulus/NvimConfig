return {
  {
    "folke/flash.nvim",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash: Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Flash: Remote",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash: Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Flash: Toggle Search",
      },
      {
        "<c-space>",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter {
            actions = {
              ["<c-space>"] = "next",
              ["<BS>"] = "prev",
            },
          }
        end,
        desc = "Flash: Treesitter Incremental Selection",
      },
    },
  },
}
