local indent_size = 2
local use_tabs = false

local settings = string.format("setlocal softtabstop=%s tabstop=%s shiftwidth=%s", indent_size, indent_size, indent_size)

if use_tabs == true then
  settings = settings .. " noexpandtab"
else
  settings = settings .. " expandtab"
end

vim.cmd(settings)
