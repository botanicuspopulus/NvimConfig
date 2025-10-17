return {
  {
    "folke/snacks.nvim",
    lazy = true,
    keys = {
      -- Explorer
      {
        "<leader>e",
        function() require("snacks").explorer() end,
        desc = "File Explorer",
      },
      -- Scratch
      {
        "<leader>.",
        function() require("snacks").scratch() end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>sS",
        function() require("snacks").scratch.select() end,
        desc = "Select Scratch Buffer",
      },
      -- Find
      {
        "<leader>fb",
        function() require("snacks").picker.buffers() end,
        desc = "Find: Buffers",
      },
      {
        "<leader>fF",
        function() require("snacks").picker.smart() end,
        desc = "Find: Files (Root)",
      },
      {
        "<leader>ff",
        function() require("snacks").picker.files { root = false } end,
        desc = "Find: Files (pwd)",
      },
      {
        "<leader>fh",
        function() require("snacks").picker.help() end,
        desc = "Find: Help",
      },
      {
        "<leader>fH",
        function() require("snacks").picker.command_history() end,
        desc = "Find: Command History",
      },
      {
        "<leader>f:",
        function() require("snacks").picker.commands() end,
        desc = "Find: Commands",
      },
      {
        "<leader>f/",
        function() require("snacks").picker.grep() end,
        desc = "Find: Grep",
      },
      {
        "<leader>fB",
        function() require("snacks").picker.grep_buffers() end,
        desc = "Find: Grep Open Buffers",
      },
      {
        "<leader>fw",
        function() require("snacks").picker.grep_word() end,
        desc = "Find: Visual Selection or Word",
        mode = { "n", "x" },
      },
      {
        "<leader>fg",
        function() require("snacks").picker.git_fiiles() end,
        desc = "Find: Git Files",
      },
      {
        "<leader>fr",
        function() require("snacks").picker.recent() end,
        desc = "Find: Recent Files",
      },
      {
        "<leader>fc",
        function() require("snacks").picker.files { cwd = vim.fn.stdpath "config" } end,
        desc = "Find: Config File",
      },
      {
        "<leader>fp",
        function() require("snacks").picker.projects() end,
        desc = "Find: Project",
      },
      {
        "<leader>fn",
        function() require("snacks").picker.notifications() end,
        desc = "Find: Notification History",
      },
      {
        "<leader>fu",
        function() require("snacks").picker.undo() end,
        desc = "Find: Undo History",
      },
      {
        "<leader>fm",
        function() require("snacks").picker.man() end,
        desc = "Find: Man Pages",
      },
      {
        "<leader>fM",
        function() require("snacks").picker.marks() end,
        desc = "Find: Marks",
      },
      {
        "<leader>f@",
        function() require("snacks").picker.registers() end,
        desc = "Find: Registers",
      },
      {
        "<leader>fk",
        function() require("snacks").picker.keymaps() end,
        desc = "Find: Keymaps",
      },
      {
        "<leader>fj",
        function() require("snacks").picker.jumps() end,
        desc = "Find: Jumps",
      },
      {
        "<leader>fl",
        function() require("snacks").picker.lines() end,
        desc = "Find: Lines",
      },
      {
        "<leader>fi",
        function() require("snacks").picker.icons() end,
        desc = "Find: Icons",
      },
      -- Git
      {
        "<leader>gb",
        function() require("snacks").picker.git_branches() end,
        desc = "Git: Branches",
      },
      {
        "<leader>gl",
        function() require("snacks").picker.git_log() end,
        desc = "Git: Log",
      },
      {
        "<leader>gL",
        function() require("snacks").picker.git_log_line() end,
        desc = "Git: Log Line",
      },
      {
        "<leader>gs",
        function() require("snacks").picker.git_status() end,
        desc = "Git: Status",
      },
      {
        "<leader>gS",
        function() require("snacks").picker.git_stash() end,
        desc = "Git: Stash",
      },
      {
        "<leader>gd",
        function() require("snacks").picker.git_diff() end,
        desc = "Git: Diff (Hunks)",
      },
      {
        "<leader>gf",
        function() require("snacks").picker.git_log_file() end,
        desc = "Git: Log File",
      },
      {
        "<leader>gg",
        function() require("snacks").lazygit() end,
        desc = "Git: Lazygit",
      },
      -- LSP
      {
        "<leader>ls",
        function() require("snacks").picker.lsp_symbols() end,
        desc = "LSP: Symbols",
      },
      {
        "<leader>lS",
        function() require("snacks").picker.lsp_workspace_symbols() end,
        desc = "LSP: Workspace Symbols",
      },
      -- Other
      {
        "<leader>rf",
        function() require("snacks").rename.rename_file() end,
        desc = "Rename File",
      },
      {
        "<leader>bd",
        function() require("snacks").bufdelete() end,
        desc = "Buffer: Delete",
      },
      {
        "<leader>bo",
        function() require("snacks").bufdelete() end,
        desc = "Buffer: Delete Others",
      },
      {
        "<leader>bD",
        "<cmd>:bd<cr>",
        desc = "Buffer: Delete Buffer and Window",
      },
      {
        "<leader>tt",
        function() require("snacks").terminal() end,
        desc = "Terminal: Toggle",
      },
      {
        "]]",
        function() require("snacks").words.jump(vim.v.count1) end,
        desc = "Next Reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function() require("snacks").words.jump(-vim.v.count1) end,
        desc = "Previous Reference",
        mode = { "n", "t" },
      },
    },
  },
}
