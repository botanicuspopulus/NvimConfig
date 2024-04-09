local utils = require "astrocore"
local prefix = "<leader>N"
local pickers_to_load = "alt_font emoji nerd_font nerd_font_v3 symbols"

utils.set_mappings {
  n = {
    [prefix] = { name = " Nerd Font Icon Picker" },
    [prefix .. "i"] = { "<cmd>IconPickerNormal " .. pickers_to_load .. "<CR>", desc = "Normal Mode" },
    [prefix .. "y"] = { "<cmd>IconPickerYank<CR>", desc = "Yank Selected Icon to Buffer" },
  },
  i = {
    ["<M-I>"] = { "<cmd>IconPickerInsert " .. pickers_to_load .. "<CR>", desc = "Insert Mode Icon Picker" },
  },
}

return {
  {
    "ziontee113/icon-picker.nvim",
    dependencies = { { "stevearc/dressing.nvim" } },
    event = "User AstroFile",
    opts = { disable_legacy_commands = true },
  },
}
