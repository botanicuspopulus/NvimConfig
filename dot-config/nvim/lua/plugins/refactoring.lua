return {
  {
    "ThePrimeagen/refactoring.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>r", "", desc = "+refactor", mode = { "n", "x" } },
      {
        "<leader>rs",
        pick,
        mode = { "n", "x" },
        desc = "Refactor",
      },
      {
        "<leader>ri",
        function() return require("refactoring").refactor "Inline Variable" end,
        mode = { "n", "x" },
        desc = "Refactor: Inline Variable",
        expr = true,
      },
      {
        "<leader>rb",
        function() return require("refactoring").refactor "Extract Block" end,
        mode = { "n", "x" },
        desc = "Refactor: Extract Block",
        expr = true,
      },
      {
        "<leader>rf",
        function() return require("refactoring").refactor "Extract Block To File" end,
        mode = { "n", "x" },
        desc = "Refactor: Extract Block to File",
        expr = true,
      },
      {
        "<leader>rf",
        function() return require("refactoring").refactor("Extract Function") end,
        mode = { "n", "x" },
        desc = "Refactor: Extract Function",
        expr = true,
      },
      {
        "<leader>rF",
        function() return require("refactoring").refactor("Extract Function to File") end,
        mode = { "n", "x" },
        desc = "Refactor: Extract Function to File",
        expr = true,
      },
      {
        "<leader>rx",
        function() return require("refactoring").refactor("Extract Variable") end,
        mode = { "n", "x" },
        desc = "Refactor: Extract Variable",
        expr = true,
      },
      {
        "<leader>rp",
        function() return require("refactoring").debug.printf({ below = false }) end,
        mode = { "n", "x" },
        desc = "Refactor: Debug Print",
      },
      {
        "<leader>rP",
        function() return require("refactoring").debug.print_var({ normal = true }) end,
        desc = "Refactor: Debug Print Variable",
      },
      {
        "<leader>rc",
        function() return require("refactoring").debug.cleanup({}) end,
        desc = "Refactor: Debug Cleanup",
      },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = true,
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
    end,
  },
}
