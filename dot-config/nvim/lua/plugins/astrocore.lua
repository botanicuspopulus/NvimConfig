-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = false, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      float = {
        focusable = false,
        source = "if_many",
        style = "minimal",
        border = "rounded",
        header = "",
        prefix = "",
      },
      virtual_text = true,
      virtual_lines = { current_line = true },
      underline = true,
      severity_sort = true,
      update_in_insert = false,
    },
    rooter = {
      autochdir = false,
      notify = false,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        autoread = true, -- sets vim.opt.autoread
        autoindent = true,
        cindent = true,
        smartindent = true,
        expandtab = true,
        confirm = false,
        cmdheight = 1,
        joinspaces = false,
        conceallevel = 3,
        list = true,
        listchars = {
          tab = "» ",
          trail = "·",
          nbsp = "␣",
          eol = "↲",
          extends = "⟩",
          precedes = "⟨",
        },
        matchtime = 2,
        mouse = "nv",
        signcolumn = "auto",
        textwidth = 80,
        inccommand = "nosplit",
        shiftwidth = 2,
        tabstop = 2,
        scrolloff = 5,
        sidescrolloff = 10,
        wildmode = "longest:full,full",
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
