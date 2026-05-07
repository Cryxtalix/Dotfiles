local indent_size = 4
local use_tabs = false

local settings = string.format("setlocal softtabstop=%s tabstop=%s shiftwidth=%s", indent_size, indent_size, indent_size)

if use_tabs == true then
  settings = settings .. " noexpandtab"
else
  settings = settings .. " expandtab"
end

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

vim.cmd(settings)
