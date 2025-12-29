for _, source in ipairs {
  "config.autocmds",
  "config.options",
  "config.keymappings",
} do
  local ok, fault = pcall(require, source)
  if not ok then vim.api.nvim_err_writeln("Failed to source " .. source .. "\n\n" .. fault) end
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
    { import = "plugins.lsp" },
  },
  install = { colorscheme = { "catppuccin-macchiato" } },
  performance = {
    rtp = {
      disable_plugins = {
        "2html_plugin",
        "bureport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "loaded_remote_plugins",
        "loaded_tutor_mode_plugin",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "synmenu",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
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
  vim = {
    inlay_hints = {
      enabled = true,
      exclude = { "vue" },
    },
    codelens = {
      enabled = false,
    },
    folds = {
      enabled = true,
    },
  },
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

    local function keymap_n(keybind, action, desc)
      vim.keymap.set("n", keybind, action, { desc = desc, buffer = ev.buf })
    end

    local keys = {
      { "gD", vim.lsp.buf.declaration, "LSP: Go To Declaration" },
      { "gd", vim.lsp.buf.definition, "LSP: Go To Definition" },
      { "gy", vim.lsp.buf.type_definition, "LSP: Type Definition" },
      { "gr", vim.lsp.buf.references, "LSP: References" },
      { "gi", vim.lsp.buf.implementation, "LSP: Go To Implementation" },
      { "K", vim.lsp.buf.hover, "LSP: Hover" },
      { "<leader>ls", vim.lsp.buf.signature_help, "LSP: Open Signature Help" },
      { "<space>ld", vim.diagnostic.open_float, "LSP: Show Diagnostic in Floating Window" },
      { "[d", vim.diagnostic.goto_prev, "LSP: Go To Next Diagnostic" },
      { "]d", vim.diagnostic.goto_next, "LSP: Go To Previous Diagnostic" },
      { "<space>la", vim.lsp.buf.code_action, "LSP: Code Action" },
      { "<space>lq", vim.diagnostic.setloclist, "LSP: Add Buffer Diagnostic to Location List" },
      { "<space>lwa", vim.lsp.buf.add_workspace_folder, "LSP: Add Workspace Folder" },
      { "<space>lwr", vim.lsp.buf.remove_workspace_folder, "LSP: Remove Workspace Folder" },
      {
        "<space>lwl",
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        "LSP: List Workspace Folders",
      },
      { "<space>lr", vim.lsp.buf.rename, "LSP: Rename" },
      { "<space>lf", function() vim.lsp.buf.format { async = true } end, "LSP: Format Buffer" },
    }

    for _, keybind in ipairs(keys) do
      keymap_n(unpack(keybind))
    end
  end,
})

vim.schedule(function()
  vim.lsp.enable "luals"
  vim.lsp.enable "stylua"
  vim.lsp.enable "clangd"
  vim.lsp.enable "ruff"
  vim.lsp.enable "basedpyright"
  vim.lsp.enable "cmake"
  vim.lsp.enable "dockerls"
  vim.lsp.enable "jsonls"
  vim.lsp.enable "vtsls"
  vim.lsp.enable "biome"
  vim.lsp.enable "htmlls"
  vim.lsp.enable "cssls"
  vim.lsp.enable "emmet_ls"
  vim.lsp.enable "svelte"
end)

local original_print = print

print = function(...)
  local args = { ... }
  local message = table.concat(vim.tbl_map(tostring, args), " ")
  vim.notify(message, vim.log.levels.INFO, { title = "Print" })
end

vim.api.nvim_err_writeln = function(msg) vim.notify(msg, vim.loglevel.ERROR, { title = "Error" }) end

vim.api.nvim_err_writeln = function(msg)
  if msg == "\n" then return end
  vim.notify(msg, vim.log.levels.ERROR, { title = "Error" })
end

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local lvl = ({ "ERROR", "WARN", "INFO", "INFO" })[result.type]
  vim.notify(result.message, lvl, {
    title = client and client.name or "LSP",
    timeout = 5000,
  })
end
