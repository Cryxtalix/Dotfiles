local size = 2

local settings = string.format("setlocal softtabstop=%s tabstop=%s shiftwidth=%s expandtab", size, size, size)

vim.cmd(settings)

-- Check http://vimcasts.org/episodes/tabs-and-spaces/ for more info on tabs and spaces
