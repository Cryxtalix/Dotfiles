-- Basic
vim.g.mapleader = " "
vim.opt.mouse = ''
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Directory for swap files
vim.opt.directory = vim.fn.expand("~/.local/share/nvim/swap//")
-- Search into subfolders
-- Provides tab completion for file related tasks
vim.opt.path:append '**'
-- Display all matching files when we tab complete
vim.opt.wildmenu = true
vim.cmd("filetype plugin on")
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Working tabs and windows
--vim.keymap.set('n', '<leader>f', '<cmd>Neotree<CR>', { desc = 'Open Neotree' })
--vim.keymap.set("n", '<leader>c',function()
--  vim.cmd("Tex")
--  vim.cmd("wincmd r")
--end, { desc = "Open tab"})
--vim.keymap.set("n", '<leader>v', function()
--  vim.cmd("Vex")
--  vim.cmd("wincmd x")
--  vim.cmd("wincmd l")
--  vim.cmd("enew")
--end, { desc = "Open vertical split" })
--vim.keymap.set("n", '<leader>h', function()
--  vim.cmd("Sex")
--  vim.cmd("wincmd x")
--  vim.cmd("wincmd j")
--end, { desc = "Open horizontal split" })
--vim.keymap.set('n', '<C-l>', '<cmd>tabnext +<CR>', { desc = 'Switch next tab' })
--vim.keymap.set('n', '<C-h>', '<cmd>tabnext -<CR>', { desc = 'Switch prev tab' })
--vim.keymap.set('n', '<A-k>', '<cmd>wincmd k<CR>', { desc = 'Move cursor to window above' })
--vim.keymap.set('n', '<A-j>', '<cmd>wincmd j<CR>', { desc = 'Move cursor to window below' })
--vim.keymap.set('n', '<A-h>', '<cmd>wincmd h<CR>', { desc = 'Move cursor to window left' })
--vim.keymap.set('n', '<A-l>', '<cmd>wincmd l<CR>', { desc = 'Move cursor to window right' })

vim.diagnostic.config({
  virtual_text = false,  -- Disable inline text diagnostics
  signs = true,          -- Keep signs in the sign column
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

-- Show diagnostics on hover
vim.o.updatetime = 250 -- Faster update time for hover
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

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

-- Rename Tmux Window to File Opened by Neovim
-- https://github.com/Dyslectric/neovim-tmux-window-rename
if vim.env.TMUX ~= nil then
  -- Define an autocommand for BufEnter and FocusGained events
  vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    pattern = "*",
    callback = function()
      local file_name = vim.fn.expand("%:t")
      local folder_name = vim.fn.expand("%:p:h:t")
      local tmux_command = string.format(
        "tmux rename-window 'Nv:%s/%s'", folder_name, file_name
      )
      vim.fn.system(tmux_command)
    end
  })

  -- Define an autocommand for the VimLeave event
  vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
      local shell = vim.env.SHELL or "sh"
      vim.fn.system("tmux set-window-option automatic-rename on")
    end
  })
end

require("lazy").setup("plugins")
