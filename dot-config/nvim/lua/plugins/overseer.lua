return {
  "stevearc/overseer.nvim",
  event = "User AstroFile",
  opts = {
    strategy = "toggleterm",
    templates = { "builtin", "user" },
    components = {
      "on_output_quickfix",
      "on_result_diagnostics",
      "on_exit_set_status",
      "defualt",
    },
    task_list = {
      direction = "bottom",
      min_height = 10,
      max_height = 20,
      default_detail = 1,
    },
  },
}
