return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          keys = {
            {
              "gD",
              function()
                local win = vim.api.nvim_get_current_win()
                local params = vim.lsp.util.make_position_params(win, "utf-16")
                vim.lsp.buf.execute_command {
                  command = "typescript.goToSourceDefinition",
                  arguments = { params.textDocument.uri, params.position },
                }
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              function()
                local result = vim.lsp.buf_request_sync(0, "workspace/executeCommand", {
                  command = "typescript.findAllFileReferences",
                  arguments = { vim.uri_from_bufnr(0) },
                  1000,
                })

                if result then vim.lsp.util.jump_to_location(result[1].result[1]) end
              end,
              desc = "File References",
            },
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { "source.organizeImport" },
                    diagnostics = {},
                  },
                }
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { "source.addMissingImports.ts" },
                    diagnostics = {},
                  },
                }
              end,
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                }
              end,
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { "source.fixAll.ts" },
                    diagnostics = {},
                  },
                }
              end,
              desc = "Fix all diagnostics",
            },
            {
              "<leader>cV",
              function() vim.lsp.buf.execute_command { command = "typescript.selectTypeScriptVersion" } end,
              desc = "Select TS workspace version",
            },
          },
        },
      },
    },
  },
}
