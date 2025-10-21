-- Buffer
local buffer_prefix = "<leader>b"
local buffer_keys = {
  {
    buffer_prefix .. "d",
    function() require("snacks").bufdelete() end,
    desc = "Buffer: Delete",
  },
  {
    buffer_prefix .. "o",
    function() require("snacks").bufdelete() end,
    desc = "Buffer: Delete Others",
  },
  {
    buffer_prefix .. "D",
    "<cmd>:bd<cr>",
    desc = "Buffer: Delete Buffer and Window",
  },
}

-- Scratch
local scratch_prefix = "<leader>S"
local scratch_keys = {
  {
    scratch_prefix .. "c",
    function() require("snacks").scratch() end,
    desc = "Toggle Scratch Buffer",
  },
  {
    scratch_prefix .. "s",
    function() require("snacks").scratch.select() end,
    desc = "Select Scratch Buffer",
  },
}

-- Find
local find_prefix = "<leader>f"
local find_keys = {
  {
    find_prefix .. "b",
    function() require("snacks").picker.buffers() end,
    desc = "Find: Buffers",
  },
  {
    find_prefix .. "F",
    function() require("snacks").picker.smart() end,
    desc = "Find: Files (Root)",
  },
  {
    find_prefix .. "f",
    function() require("snacks").picker.files { root = false } end,
    desc = "Find: Files (pwd)",
  },
  {
    find_prefix .. "h",
    function() require("snacks").picker.help() end,
    desc = "Find: Help",
  },
  {
    find_prefix .. "H",
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
    find_prefix .. "B",
    function() require("snacks").picker.grep_buffers() end,
    desc = "Find: Grep Open Buffers",
  },
  {
    find_prefix .. "w",
    function() require("snacks").picker.grep_word() end,
    desc = "Find: Visual Selection or Word",
    mode = { "n", "x" },
  },
  {
    find_prefix .. "g",
    function() require("snacks").picker.git_fiiles() end,
    desc = "Find: Git Files",
  },
  {
    find_prefix .. "r",
    function() require("snacks").picker.recent() end,
    desc = "Find: Recent Files",
  },
  {
    find_prefix .. "c",
    function() require("snacks").picker.files { cwd = vim.fn.stdpath "config" } end,
    desc = "Find: Config File",
  },
  {
    find_prefix .. "p",
    function() require("snacks").picker.projects() end,
    desc = "Find: Project",
  },
  {
    find_prefix .. "n",
    function() require("snacks").picker.notifications() end,
    desc = "Find: Notification History",
  },
  {
    find_prefix .. "u",
    function() require("snacks").picker.undo() end,
    desc = "Find: Undo History",
  },
  {
    find_prefix .. "m",
    function() require("snacks").picker.man() end,
    desc = "Find: Man Pages",
  },
  {
    find_prefix .. "M",
    function() require("snacks").picker.marks() end,
    desc = "Find: Marks",
  },
  {
    "<leader>f@",
    function() require("snacks").picker.registers() end,
    desc = "Find: Registers",
  },
  {
    find_prefix .. "k",
    function() require("snacks").picker.keymaps() end,
    desc = "Find: Keymaps",
  },
  {
    find_prefix .. "j",
    function() require("snacks").picker.jumps() end,
    desc = "Find: Jumps",
  },
  {
    find_prefix .. "l",
    function() require("snacks").picker.lines() end,
    desc = "Find: Lines",
  },
  {
    find_prefix .. "i",
    function() require("snacks").picker.icons() end,
    desc = "Find: Icons",
  },
}

-- Git
local git_prefix = "<leader>g"
local git_keys = {
  {
    git_prefix .. "b",
    function() require("snacks").picker.git_branches() end,
    desc = "Git: Branches",
  },
  {
    git_prefix .. "l",
    function() require("snacks").picker.git_log() end,
    desc = "Git: Log",
  },
  {
    git_prefix .. "L",
    function() require("snacks").picker.git_log_line() end,
    desc = "Git: Log Line",
  },
  {
    git_prefix .. "s",
    function() require("snacks").picker.git_status() end,
    desc = "Git: Status",
  },
  {
    git_prefix .. "S",
    function() require("snacks").picker.git_stash() end,
    desc = "Git: Stash",
  },
  {
    git_prefix .. "d",
    function() require("snacks").picker.git_diff() end,
    desc = "Git: Diff (Hunks)",
  },
  {
    git_prefix .. "f",
    function() require("snacks").picker.git_log_file() end,
    desc = "Git: Log File",
  },
  {
    git_prefix .. "g",
    function() require("snacks").lazygit() end,
    desc = "Git: Lazygit",
  },
}

-- LSP
local lsp_prefix = "<leader>l"
local lsp_keys = {
  {
    lsp_prefix .. "s",
    function() require("snacks").picker.lsp_symbols() end,
    desc = "LSP: Symbols",
  },
  {
    lsp_prefix .. "S",
    function() require("snacks").picker.lsp_workspace_symbols() end,
    desc = "LSP: Workspace Symbols",
  },
}

-- Explorer
local explorer_keys = {
  {
    "<leader>e",
    function() require("snacks").explorer() end,
    desc = "File Explorer",
  },
}

-- Other
local misc_keys = {
  {
    "<leader>rf",
    function() require("snacks").rename.rename_file() end,
    desc = "Rename File",
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
}

local keys = {}

local extend_keybinds = function(keybind_table) vim.list_extend(keys, keybind_table) end

for _, keybinds in ipairs {
  buffer_keys,
  scratch_keys,
  find_keys,
  git_keys,
  lsp_keys,
  explorer_keys,
  misc_keys,
} do
  extend_keybinds(keybinds)
end

return {
  {
    "folke/snacks.nvim",
    lazy = true,
    keys = keys,
  },
}
