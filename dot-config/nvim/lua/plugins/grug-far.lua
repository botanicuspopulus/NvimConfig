return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar", "GrugFarWithin" },
    event = "BufEnter",
    opts = {
      headerMaxWidth = 80,
      resultLocation = { showNumberLabel = true },
    },
    keys = {},
    config = function(_, opts)
      local grug = require "grug-far"

      grug.setup(opts)

      local function keymap(mode, l, h, desc) vim.keymap.set(mode, l, h, { desc = desc }) end

      keymap({ "n", "v" }, "<leader>sr", function()
        local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"

        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and ("*." .. ext) or nil,
          },
        }
      end, "Search and Replace")

      keymap(
        "n",
        "<leader>sf",
        function()
          grug.toggle_instance {
            instanceName = "far",
            staticTitle = "Search and Replace",
          }
        end,
        "Toggle Search and Replace"
      )

      keymap(
        { "n" },
        "<leader>s1",
        function() grug.open { transient = true, prefills = { paths = vim.fn.expand "%" } } end,
        "Search and Replace (Current File)"
      )

      keymap(
        "n",
        "<leader>sw",
        function() grug.open { transient = true, prefills = { search = vim.fn.expand "<cword>" } } end,
        "Search and Replace (Word)"
      )

      keymap("x", "<leader>ss", function() grug.open { transient = true } end, "Search and Replace (Use Selection)")

      keymap(
        { "n", "x" },
        "<leader>si",
        function() grug.open { visualSelectionUsage = "operate-within-range" } end,
        "Search and Replace (Within Selection)"
      )
    end,
  },
}
