-- Find the project's virtualenv so third-party packages resolve without activating it first
local function find_python(root)
  if vim.env.VIRTUAL_ENV then return vim.env.VIRTUAL_ENV .. "/bin/python" end

  for _, dir in ipairs { ".venv", "venv", ".env", "env" } do
    local python = root and vim.fs.joinpath(root, dir, "bin", "python")
    if python and vim.fn.executable(python) == 1 then return python end
  end
end

return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml" },
  before_init = function(_, config)
    local python = find_python(config.root_dir)
    if python then config.settings.python = vim.tbl_extend("force", config.settings.python or {}, { pythonPath = python }) end
  end,
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        -- Diagnostics come from ruff
        ignore = { "*" },
        autoImportCompletions = true,
        typeCheckingMode = "standard",
      },
    },
  },
}
