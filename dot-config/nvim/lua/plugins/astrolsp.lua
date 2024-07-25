-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--		 as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		-- Configuration table of features provided by AstroLSP
		features = {
			autoformat = true, -- Enable or disable auto formatting on start
			codelens = true, -- Enable/disable codelens refresh on start
			inlay_hints = true, -- Enable/disable inlay hints on start
			semantic_tokens = true, -- Enable/disable semantic token highlighting
		},
		-- Customize lsp formatting options
		formatting = {
			-- Control auto formatting on save
			format_on_save = {
				enabled = false, -- Enable or disable format on save globally
				allow_filetypes = { -- Enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- Disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- Disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				"lua_ls",
			},
			timeout_ms = 1000, -- Default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--	 return true
			-- end
		},
		-- Enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		-- Customize language server configuration options passed to `lspconfig`
		---@diagnostic disable: missing-fields
		config = {
			clangd = { capabilities = { offsetEncoding = "utf-8" } },
			harper_ls = {
				settings = {
					["harper-ls"] = {
						linters = {
							sentence_capitalization = false,
							long_sentences = false,
						},
					},
				}
			},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							autopep8 = {
								enabled = false
							},
							flake8 = {
								ignore = {"E501"}
							},
							pycodestyle = {
								maxLineLength = 120
							},
						}
					}
				}
			},
			ruff = {
				init_options = {
					settings = {
						lineLength = 120,
					}
				}
			},
			ruff_lsp = {
				init_options = {
					settings = {
						lineLength = 120,
					}
				}
			},
		},
		-- Customize how language servers are attached
		handlers = {
            icons = true,
			-- A function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
			-- function(server, opts) require("lspconfig")[server].setup(opts) end
			-- The key is the server that is being setup with `lspconfig`
			-- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
			-- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
		},
		-- Configure buffer local auto commands to add when attaching a language server
		autocmds = {
			-- First key is the `ugroup` to add the auto commands to (:h augroup)
			lsp_document_highlight = {
				-- Optional condition to create/delete auto command group can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
				-- condition will be resolved for each client on each execution and if it ever fails for all clients,
				-- the auto commands will be deleted for that buffer
				cond = "textDocument/documentHighlight",
				-- cond = function(client, bufnr) return client.name == "lua_ls" end,
				-- list of auto commands to set
				{
					-- events to trigger
					event = { "CursorHold", "CursorHoldI" },
					-- the rest of the autocmd options (:h nvim_create_autocmd)
					desc = "Document Highlighting",
					callback = function() vim.lsp.buf.document_highlight() end,
				},
				{
					event = { "CursorMoved", "CursorMovedI", "BufLeave" },
					desc = "Document Highlighting Clear",
					callback = function() vim.lsp.buf.clear_references() end,
				},
			},
		},
		-- mappings to be set up on attaching of a language server
		mappings = {
			n = {
				gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
				-- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
				-- gD = {
				--	 function() vim.lsp.buf.declaration() end,
				--	 desc = "Declaration of current symbol",
				--	 cond = "textDocument/declaration",
				-- },
				-- ["<Leader>uY"] = {
				--	 function() require("astrolsp.toggles").buffer_semantic_tokens() end,
				--	 desc = "Toggle LSP semantic highlight (buffer)",
				--	 cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
				-- },
			},
		},
		-- A custom `on_attach` function to be run after the default `on_attach` function
		-- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
		on_attach = function(client, bufnr)
			-- this would disable semanticTokensProvider for all clients
			-- client.server_capabilities.semanticTokensProvider = nil
		end,
	},
}
