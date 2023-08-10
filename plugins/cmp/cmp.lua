return {
  {
    'hrsh7th/nvim-cmp',
    keys = { ':', '/', '?' },
    dependencies = {
      'amarakon/nvim-cmp-buffer-lines',
      'andersevenrud/cmp-tmux',
      'chrisgrieser/cmp-nerdfont',
      'delphinus/cmp-ctags',
      'FelipeLema/cmp-async-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      -- 'hrsh7th/cmp-copilot',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lua',
      --'hrsh7th/cmp-path',
      'jcdickinson/codeium.nvim',
      'lukas-reineke/cmp-rg',
      'max397574/cmp-greek',
      'neovim/nvim-lspconfig',
      'onsails/lspkind-nvim',
      'paopaol/cmp-doxygen',
      'petertriho/cmp-git',
      'ray-x/cmp-treesitter',
      'saadparwaiz1/cmp_luasnip',
      'tamago324/cmp-zsh',
      'tzachar/cmp-fuzzy-buffer',
      'tzachar/cmp-fuzzy-path',
      -- 'tzachar/cmp-tabnine',
      -- 'zbirbaum/copilot-cmp',
    },

    opts = function(_, opts)
      local cmp = require('cmp')
      opts.formatting.format = require("lspkind").cmp_format {
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "",
        symbol_map = {
          Codeium = "󰘦",
        },
      }

      opts.sources = cmp.config.sources({
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'treesitter' },
        { name = 'ctags' },
        { name = 'npm' },
        { name = 'git' },
        { name = 'zsh' },
        { name = 'tmux' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'doxygen' },
        -- { name = "async_path" },
        { name = 'fuzzy_path' },
        { name = 'fuzzy_buffer' },
        -- { name = 'rg' },
        -- { name = "buffer" },
        { name = 'nerdfont' },
        { name = 'greek' },
        { name = 'emoji' },
        { name = "calc" },
        { name = "spell",
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
          }
        },
      })
      opts.duplicates.npm = 1

      opts.view = { entries = 'native' }

      opts.experimental = {
        ghost_text = true,
      }

      opts.preselect = cmp.PreselectMode.None

      opts.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
      opts.mapping["<C-m>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end, { "i" })

      opts.window = {
        completion = {
          col_offset = -3,
          side_padding = 0,
        },
      }

      return opts
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      -- run cmp setup
      cmp.setup(opts)

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
            { name = "buffer" },
          }),
      })

      -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
      cmp.setup.cmdline("/", {
        enabled = function()
          -- Set of commands where cmp will be disabled
          local disabled = {
            IncRename = true
          }
          -- Get first word of cmdline
          local cmd = vim.fn.getcmdline():match("%S+")
          -- Return true if cmd isn't disabled
          -- else call/return cmp.close(), which returns false
          return not disabled[cmd] or cmp.close()
        end,
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "nvim_lsp_document_symbol" }
          }, {
              { name = "buffer" }
          }),
        })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
      })
    end,
  },
}
