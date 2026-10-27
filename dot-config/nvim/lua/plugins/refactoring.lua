local function refactor(name, suffix)
  return function() return require("refactoring")[name]() .. (suffix or "") end
end

local function debug(name, opts, suffix)
  return function() return require("refactoring.debug")[name](opts) .. (suffix or "") end
end

return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "lewis6991/async.nvim",
    },
    keys = {
      { "<leader>r", "", desc = "+refactor", mode = { "n", "x" } },
      {
        "<leader>rs",
        function() require("refactoring").select_refactor() end,
        mode = { "n", "x" },
        desc = "Refactor: Select",
      },
      { "<leader>ri", refactor "inline_var", mode = { "n", "x" }, desc = "Refactor: Inline Variable", expr = true },
      { "<leader>rI", refactor "inline_func", mode = { "n", "x" }, desc = "Refactor: Inline Function", expr = true },
      { "<leader>rf", refactor "extract_func", mode = { "n", "x" }, desc = "Refactor: Extract Function", expr = true },
      {
        "<leader>rF",
        refactor "extract_func_to_file",
        mode = { "n", "x" },
        desc = "Refactor: Extract Function to File",
        expr = true,
      },
      { "<leader>rx", refactor "extract_var", mode = { "n", "x" }, desc = "Refactor: Extract Variable", expr = true },
      {
        "<leader>rp",
        debug("print_loc", { output_location = "below" }),
        desc = "Refactor: Debug Print Location",
        expr = true,
      },
      {
        "<leader>rP",
        debug("print_var", { output_location = "below" }, "iw"),
        desc = "Refactor: Debug Print Variable",
        expr = true,
      },
      {
        "<leader>rP",
        debug("print_var", { output_location = "below" }),
        mode = "x",
        desc = "Refactor: Debug Print Variable",
        expr = true,
      },
      -- Operator: follow with a motion/textobject (e.g. `ip`, `G`) or use on a selection
      {
        "<leader>rc",
        debug("cleanup", { restore_view = true }),
        mode = { "n", "x" },
        desc = "Refactor: Debug Cleanup",
        expr = true,
      },
    },
    opts = {
      show_success_message = true,
    },
  },
}
