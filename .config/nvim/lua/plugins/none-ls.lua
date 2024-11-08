-- https://github.com/nvimtools/none-ls.nvim
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Formatting
        -- null_ls.builtins.formatting.<package>,
        --
        -- Diagnostics
        -- null_ls.builtins.diagnostics.<package>,
        --
        -- Completion
        -- null_ls.builtins.completion.<package>,
      }
    })

    vim.api.nvim_create_user_command(
      "Format",
      function()
        vim.lsp.buf.format()
      end,
      {}
    )
  end
}
