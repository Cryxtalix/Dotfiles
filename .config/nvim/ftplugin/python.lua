local size = 4

local settings = string.format("setlocal softtabstop=%s tabstop=%s shiftwidth=%s expandtab", size, size, size)

vim.cmd(settings)
