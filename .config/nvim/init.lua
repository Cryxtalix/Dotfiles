-- Basic
vim.g.mapleader = " "
vim.opt.mouse = ''
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Search into subfolders
-- Provides tab completion for file related tasks
vim.opt.path:append '**'
-- Display all matching files when we tab complete
vim.opt.wildmenu = true
vim.cmd("filetype plugin on")
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Install Lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
