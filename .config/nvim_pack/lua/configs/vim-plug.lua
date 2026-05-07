vim.api.nvim_create_user_command(
  "Update",
    function()
      vim.pack.update()
    end,
  {}
)

