return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
        },
      },
      severity_sort = true,
      inlay_hints = {
        enabled = true,
        exclude = {
          "vue",
        },
      },
      codelens = {
        enabled = false,
      },
      folds = {
        enabled = true,
      },
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
    config = function()
      vim.lsp.config("*", {
        root_markers = { ".git" },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local function keymap_n(keybind, action, desc)
            vim.keymap.set("n", keybind, action, { desc = desc, buffer = ev.buf })
          end

          local keys = {
            {
              "gD",
              vim.lsp.buf.declaration,
              "LSP: Go To Declaration",
            },
            {
              "gd",
              vim.lsp.buf.definition,
              "LSP: Go To Definition",
            },
            {
              "gy",
              vim.lsp.buf.type_definition,
              "LSP: Type Definition",
            },
            {
              "gr",
              vim.lsp.buf.references,
              "LSP: References",
            },
            {
              "gi",
              vim.lsp.buf.implementation,
              "LSP: Go To Implementation",
            },
            { "K", vim.lsp.buf.hover, "LSP: Hover" },
            {
              "<leader>ls",
              vim.lsp.buf.signature_help,
              "LSP: Open Signature Help",
            },

            -- Diagnostics
            {
              "<space>ld",
              vim.diagnostic.open_float,
              "LSP: Show Diagnostic in Floating Window",
            },
            {
              "[d",
              vim.diagnostic.goto_prev,
              "LSP: Go To Next Diagnostic",
            },
            {
              "]d",
              vim.diagnostic.goto_next,
              "LSP: Go To Previous Diagnostic",
            },
            {
              "<space>la",
              vim.lsp.buf.code_action,
              "LSP: Code Action",
            },
            {
              "<space>lq",
              vim.diagnostic.setloclist,
              "LSP: Add Buffer Diagnostic to Location List",
            },

            -- Workspace Folders
            {
              "<space>lwa",
              vim.lsp.buf.add_workspace_folder,
              "LSP: Add Workspace Folder",
            },
            {
              "<space>lwr",
              vim.lsp.buf.remove_workspace_folder,
              "LSP: Remove Workspace Folder",
            },
            {
              "<space>lwl",
              function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
              "LSP: List Workspace Folders",
            },
            { "<space>lr", vim.lsp.buf.rename, "LSP: Rename" },
            {
              "<space>lf",
              function() vim.lsp.buf.format { async = true } end,
              "LSP: Format Buffer",
            },
          }

          for _, keybind in ipairs(keys) do
            keymap_n(unpack(keybind))
          end
        end,
      })
    end,
  },
}
