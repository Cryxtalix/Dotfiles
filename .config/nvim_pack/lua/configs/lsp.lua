-- Language server for specified languages
-- Hover with 'K'
-- Goto definition with :Goto
-- Open code action with :Codeact

local servers = {
  "lua_ls", "bashls", "clangd", "marksman", "pyright", "lemminx",
}

vim.pack.add({
  {
    src = "https://github.com/mason-org/mason.nvim.git",
    version = 'main',
  },
  {
    src = "https://github.com/mason-org/mason-lspconfig.nvim.git",
    version = 'main',
  },
})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
  automatic_enable = true,
})

-- Key mapping
-- Hover for definition
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- Move to definition
vim.api.nvim_create_user_command(
  "Goto",
  function()
    vim.lsp.buf.definition()
  end,
  {}
)

-- Code action
vim.api.nvim_create_user_command(
  "Codeact",
  function()
    vim.lsp.buf.code_action()
  end,
  {}
)
