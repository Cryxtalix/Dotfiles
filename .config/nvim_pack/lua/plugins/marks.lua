vim.pack.add({
  {
    src = 'https://github.com/chentoast/marks.nvim.git',
    version = 'main',
  },
})

require("marks").setup({
  event = "VeryLazy",
  opts = {},
})
