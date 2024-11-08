return {
  {
    -- Bottom bar theme
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'jellybeans'
        }
      })
    end
  }
}
