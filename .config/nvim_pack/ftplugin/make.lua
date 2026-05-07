local indent_size = 8
local use_tabs = true

local settings = string.format("setlocal softtabstop=%s tabstop=%s shiftwidth=%s", indent_size, indent_size, indent_size)

if use_tabs == true then
  settings = settings .. " noexpandtab"
else
  settings = settings .. " expandtab"
end

vim.cmd(settings)
