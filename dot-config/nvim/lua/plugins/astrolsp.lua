-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--     as this provides autocomplete and documentation while editing

local max_line_length = 120

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true, -- Enable or disable auto formatting on start
      codelens = false, -- Enable/disable codelens refresh on start
      inlay_hints = true, -- Enable/disable inlay hints on start
      semantic_tokens = true, -- Enable/disable semantic token highlighting
      signature_help = false, -- Enable/disable signature help on start
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
      --   return true
      -- end
    },
    -- Enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- Customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      harper_ls = {
        settings = {
          ["harper-ls"] = {
            linters = {
              spell_check = false,
              sentence_capitalization = false,
              long_sentences = false,
            },
          },
        }
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              autopep8 = { enabled = false },
              flake8 = { ignore = {"E501"} },
              pycodestyle = { maxLineLength = max_line_length },
              pylsp_mypy = {
                enabled = true,
                overrides = {
                  "--python-execytable",
                  function()
                    local venv = os.getenv("VIRTUAL_ENV")
                    local py_path = nil
                    if venv ~= nil then
                      py_path = venv .. "/bin/python"
                    else
                      py_path = vim.g.python3_host_prog
                    end

                    return py_path
                  end,
                  true
                },
                report_progress = true,
                live_mode = false
              },
            }
          }
        }
      },
      ruff = {
        init_options = {
          settings = {
            lineLength = max_line_length,
          }
        }
      },
      neocmakelsp = {
        cmake = {
          enble_external_cmake_lint = true,
        }
      }
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
      no_insert_inlay_hints = {
        cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
        {
          event = "InsertEnter",
          desc = "Disable inlay hints on insert",
          callback = function(args)
            local filter = { bufnr = args.buf }
            if vim.lsp.inlay_hint.is_enabled(filter) then
              vim.lsp.inlay_hint.enable(false, filter)
              vim.api.nvim_create_autocmd("InsertLeave", {
                buffer = args.buf,
                once = true,
                callback = function()
                  vim.lsp.inlay_hint.enable(true, filter)
                end,
              })
            end
          end,
        },
      },
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
        --   function() vim.lsp.buf.declaration() end,
        --   desc = "Declaration of current symbol",
        --   cond = "textDocument/declaration",
        -- },
        -- ["<Leader>uY"] = {
        --   function() require("astrolsp.toggles").buffer_semantic_tokens() end,
        --   desc = "Toggle LSP semantic highlight (buffer)",
        --   cond = function(client) return client.server_capabilities.semanticTokensProvider and vim.lsp.semantic_tokens end,
        -- },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr` (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
