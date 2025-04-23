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
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = { "lua_ls" },
      timeout_ms = 2000,
    },
    servers = {},
    ---@diagnostic disable: missing-fields
    config = {},
    handlers = { icons = true },
    autocmds = {
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
      },
    },
    on_attach = function(client, _)
      if client.name == "pylsp" then client.server_capabilities.semanticTokensProvider = nil end
    end,
  },
}
