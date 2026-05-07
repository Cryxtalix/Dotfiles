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
