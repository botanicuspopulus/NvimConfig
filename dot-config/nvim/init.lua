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
    { import = "plugins.lsp" },
    { import = "plugins.keymaps" },
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
