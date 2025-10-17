return {
  {
    'stevearc/overseer.nvim',
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    opts = {
      dap = false,
      task_list = {
        bindings = {
          ["<C-h>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
        },
      },
      form = { win_opts = { winblend = 0, }, },
      confirm = { win_opts = { winblend = 0 }, },
      task_win = { win_opts = { winblend = 0 }, },
    },
    keys = {
      { "<leader>ow", function() vim.cmd("OverseerToggle") end, desc = "Overseer: Task List" },
      { "<leader>oo", function() vim.cmd("OverseerRun") end, desc = "Overseer: Run Task" },
      { "<leader>oq", function() vim.cmd("OverseerQuickAction") end, desc = "Overseer: Quick Action" },
      { "<leader>oi", function() vim.cmd("OverseerInfo") end, desc = "Overseer: Info" },
      { "<leader>ob", function() vim.cmd("OverseerBuild") end, desc = "Overseer: Build" },
      { "<leader>ot", function() vim.cmd("OverseerTaskAction") end, desc = "Overseeer: Task Action" },
      { "<leader>oc", function() vim.cmd("OverseerClearCache") end, desc = "Overseer: Clear Cache" },
    }
  },
}
