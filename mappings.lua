-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<leader>q"] = false, -- overwritten in plugins/buffers.lua
    ["<leader>Q"] = {
      "<cmd>qa<cr>",
      desc = "Quit all",
    },
    ["<leader>gR"] = {
      "<cmd>!git rm -f %<cr>",
      desc = "git rm current file",
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr)
            require("astronvim.utils.buffer").close(bufer)

          end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["M-h"] = { "<cmd>TmuxNavigateLeft<CR>", desc = "TmuxNavigateLeft", silent = true, noremap = true },
    ["M-j"] = { "<cmd>TmuxNavigateDown<CR>", desc = "TmuxNavigateDown", silent = true, noremap = true },
    ["M-k"] = { "<cmd>TmuxNavigateUp<CR>", desc = "TmuxNavigateUp", silent = true, noremap = true },
    ["M-l"] = { "<cmd>TmuxNavigateRight<CR>", desc = "TmuxNavigateRight", silent = true, noremap = true },
  },
  t = { },
}
