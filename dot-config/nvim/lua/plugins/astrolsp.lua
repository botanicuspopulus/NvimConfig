-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--     as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = false,
      inlay_hints = false,
      semantic_tokens = true,
      signature_help = false,
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      disabled = { "lua_ls" },
      timeout_ms = 2000,
    },
    servers = {
      "basedpyright",
      "ruff",
      harper_ls = {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true,
              },
            },
          },
        },
        init_options = {
          showNotificationsOnStart = false,
          suggestionContext = "current-sentence",
        },
      },
    },
    ---@diagnostic disable: missing-fields
    config = {
      harper_ls = {
        settings = {
          ["harper-ls"] = {
            codeActions = {
              forceStable = true,
            },
            linters = {
              spelled_numbers = true,
              linking_verbs = true,
            },
            languages = {
              markdown = { enabled = true },
              latex = { enabled = true },
              plaintext = { enabled = true },
            },
          },
        },
      },
      biome = {
        cmd = { "biome", "lsp-proxy" },
        filetypes = {
          "javascript",
          "typescript",
          "json",
          "json",
          "jsonc",
          "css",
          "html",
        },
        root_dir = require("lspconfig.util").root_pattern("biome.json", "package.json", ".git"),
        format = { enabled = false },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            disableLanguageServices = false,
            analysis = {
              typeCheckingMode = "standard",
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
    },
    handlers = { icons = true },
    autocmds = {
      diagnostic_only_virtual_lines = {
        {
          event = { "CursorMoved", "DiagnosticChanged" },
          callback = function()
            if not require("astrocore.buffer").is_valid() then return end
            if og_virt_line == nil then og_virt_line = vim.diagnostic.config().virtual_lines end

            if not (og_virt_line and og_virt_line.current_line) then
              if og_virt_text then
                vim.diagnostic.config { virtual_text = og_virt_text }
                og_virt_text = nil
              end
              return
            end

            if og_virt_text == nil then og_virt_text = vim.diagnostic.config().virtual_text end

            local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

            if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
              vim.diagnostic.config { virtual_text = og_virt_text }
            else
              vim.diagnostic.config { virtual_text = false }
            end
          end,
        },
        {
          event = "ModeChanged",
          callback = function()
            if require("astrocore.buffer").is_valid() then pcall(vim.diagnostic.show) end
          end,
        },
      },
      no_insert_inlay_hints = {
        cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
        events = {
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
                  callback = function() vim.lsp.inlay_hint.enable(true, filter) end,
                })
              end
            end,
          },
        },
      },
      lsp_document_highlight = {
        cond = "textDocument/documentHighlight",
        events = {
          {
            event = { "CursorHold", "CursorHoldI" },
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
    },
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        grr = {
          function() require("snacks.picker").lsp_references() end,
          desc = "Find LSP references",
          cond = "textDocument/references",
        },
        gri = {
          function() require("snacks.picker").lsp_implementations() end,
          desc = "Find LSP implementations",
          cond = "textDocument/implementation",
        },
        gO = {
          function() require("snacks.picker").lsp_symbols() end,
          desc = "Find LSP outline",
          cond = "textDocument/documentSymbol",
        },
        gd = {
          function() require("snacks.picker").lsp_definitions() end,
        },
        gI = {
          function() require("snacks.picker").lsp_implementations() end,
        },
        gy = {
          function() require("snacks.picker").lsp_type_definitions() end,
        },
        ["<leader>lG"] = {
          function() require("snacks.picker").lsp_workspace_symbols() end,
        },
        ["<leader>lR"] = {
          function() require("snacks.picker").lsp_references() end,
        },
      },
    },
    on_attach = function(client, _)
      if client.name == "pylsp" then client.server_capabilities.semanticTokensProvider = nil end
    end,
  },
}
