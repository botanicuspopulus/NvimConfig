local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

return {
	{
		"neovim/nvim-lspconfig",
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
		opts = function()
			local ret = {
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
            'vue',
          }
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
            }
          }
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        servers = {
          stylua = { enabled = false },
          lua_ls = {
            settings = {
              Lua = {
                format = {
                  enable = true,
                  defaultConfig = {
                    indent_style = 'space',
                    indent_size = '2',
                  }
                },
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = 'Replace',
                },
                doc = {
                  privateName = { '^_' },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = 'Disable',
                  semicolon = 'Disable',
                  arrayIndex = 'Disable',
                },
              },
            },
          },
        },
			}

      return ret
		end,
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

					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ desc = "LSP: Go To Declaration", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ desc = "LSP: Go To Definition", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"gtd",
						vim.lsp.buf.type_definition,
						{ desc = "LSP: Type Definition", buffer = ev.buf }
					)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: References", buffer = ev.buf })
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ desc = "LSP: Go To Implementation", buffer = ev.buf }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover", buffer = ev.buf })
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ desc = "LSP: Open Signature Help", buffer = ev.buf }
					)

					-- Diagnostics
					vim.keymap.set(
						"n",
						"<space>ld",
						vim.diagnostic.open_float,
						{ desc = "LSP: Show Diagnostic in Floating Window", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						{ desc = "LSP: Go To Next Diagnostic", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"]d",
						vim.diagnostic.goto_next,
						{ desc = "LSP: Go To Previous Diagnostic", buffer = ev.buf }
					)
					vim.keymap.set(
						{ "n", "v" },
						"<space>la",
						vim.lsp.buf.code_action,
						{ desc = "LSP: Code Action", buffer = ev.buf }
					)
					vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

					-- Workspace Folders
					vim.keymap.set(
						"n",
						"<space>lwa",
						vim.lsp.buf.add_workspace_folder,
						{ desc = "LSP: Add Workspace Folder", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"<space>lwr",
						vim.lsp.buf.remove_workspace_folder,
						{ desc = "LSP: Remove Workspace Folder", buffer = ev.buf }
					)
					vim.keymap.set("n", "<space>lwl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "LSP: List Workspace Folders", buffer = ev.buf })
					vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, { desc = "LSP: Rename", buffer = ev.buf })
					vim.keymap.set("n", "<space>lf", function()
						vim.lsp.buf.format({ async = true })
					end, { desc = "LSP: Format Buffer", buffer = ev.buf })
				end,
			})
		end,
	},
}
