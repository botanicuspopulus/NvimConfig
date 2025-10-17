return {
  "mfussenegger/nvim-dap",
  lazy = true,
  keys = {
    {
      "<leader>dc",
      function() require("dap").continue() end,
      desc = "Debug: Run/Continue",
      mode = "n",
    },
    {
      "<leader>da",
      function() require("dap").continue { before = get_args } end,
      desc = "Debug: Run with Args",
      mode = "n",
    },
    {
      "<leader>dC",
      function() require("dap").run_to_cursor() end,
      desc = "Debug: Run to Cursor",
      mode = "n",
    },
    {
      "<leader>dl",
      function() require("dap").run_last() end,
      desc = "Debug: Run Last",
      mode = "n",
    },
    {
      "<leader>dP",
      function() require("dap").pause() end,
      desc = "Debug: Pause",
      mode = "n",
    },
    {
      "<leader>dT",
      function() require("dap").terminate() end,
      desc = "Debug: Terminate",
      mode = "n",
    },
    {
      "<leader>ds",
      function() require("dap").session() end,
      desc = "Debug: Session",
      mode = "n",
    },

    {
      "<leader>dg",
      function() require("dap").goto_() end,
      desc = "Debug: Go to Line (No Execute)",
      mode = "n",
    },

    {
      "<leader>dO",
      function() require("dap").step_over() end,
      desc = "Debug: Step Over",
      mode = "n",
    },
    {
      "<leader>di",
      function() require("dap").step_into() end,
      desc = "Debug: Step Into",
      mode = "n",
    },
    {
      "<leader>do",
      function() require("dap").step_out() end,
      desc = "Debug: Step Out",
      mode = "n",
    },
    {
      "<leader>db",
      function() require("dap").toggle_breakpoint() end,
      desc = "Debug: Toggle Breakpoint",
      mode = "n",
    },
    {
      "<leader>dB",
      function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
      desc = "Debug: Set Conditional Breakpoint",
      mode = "n",
    },
  },
}
