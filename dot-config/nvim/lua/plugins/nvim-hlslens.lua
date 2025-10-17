return {
  "kevinhwang91/nvim-hlslens",
  lazy = false,
  config = function(opts)
    local hlslens = require "hlslens"

    hlslens.setup(opts)

    local kopts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    local function mapkey(key)
      keymap("n", key, function()
        vim.cmd.normal { vim.v.count1 .. key, bang = true }
        hlslens.start()
      end, kopts)
    end

    for _, key in ipairs { "n", "N", "*", "#", "g*", "g#" } do
      mapkey(key)
    end

    keymap("n", "<leader>cl", function() vim.cmd "noh" end, { desc = "Clear Highlight" })
  end,
}
