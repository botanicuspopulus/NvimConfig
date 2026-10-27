for _, source in ipairs {
  "config.autocmds",
  "config.options",
  "config.keymappings",
} do
  local ok, fault = pcall(require, source)
  if not ok then vim.notify("Failed to source " .. source .. "\n\n" .. fault, vim.log.levels.ERROR) end
end

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local repo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.keymaps" },
    { import = "plugins.lang" },
  },
  install = { colorscheme = { "catppuccin-macchiato" } },
  performance = {
    rtp = {
      disable_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  checker = { enabled = true },
}

vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
  severity_sort = true,
}

vim.lsp.config("*", {
  capabilities = vim.tbl_deep_extend("force", require("blink.cmp").get_lsp_capabilities(), {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  }),
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end

    local function keymap_n(keybind, action, desc)
      vim.keymap.set("n", keybind, action, { desc = desc, buffer = ev.buf })
    end

    local keys = {
      { "gD", vim.lsp.buf.declaration, "LSP: Go To Declaration" },
      { "gd", vim.lsp.buf.definition, "LSP: Go To Definition" },
      { "gy", vim.lsp.buf.type_definition, "LSP: Type Definition" },
      -- Built in: grr references, gri implementation, grn rename, gra code action,
      -- grt type definition, gO document symbols, K hover, [d/]d diagnostics
      { "<leader>ls", vim.lsp.buf.signature_help, "LSP: Open Signature Help" },
      { "<leader>ld", vim.diagnostic.open_float, "LSP: Show Diagnostic in Floating Window" },
      { "<leader>la", vim.lsp.buf.code_action, "LSP: Code Action" },
      { "<leader>lq", vim.diagnostic.setloclist, "LSP: Add Buffer Diagnostic to Location List" },
      { "<leader>lwa", vim.lsp.buf.add_workspace_folder, "LSP: Add Workspace Folder" },
      { "<leader>lwr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove Workspace Folder" },
      {
        "<leader>lwl",
        function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        "LSP: List Workspace Folders",
      },
      { "<leader>lr", vim.lsp.buf.rename, "LSP: Rename" },
      { "<leader>lf", function() vim.lsp.buf.format { async = true } end, "LSP: Format Buffer" },
    }

    for _, keybind in ipairs(keys) do
      keymap_n(unpack(keybind))
    end
  end,
})

vim.lsp.enable {
  "luals",
  "stylua",
  "clangd",
  "ruff",
  "basedpyright",
  "cmake",
  "dockerls",
  "jsonls",
  "vtsls",
  "biome",
  "htmlls",
  "cssls",
  "emmet_ls",
  "svelte",
  "marksman",
}
