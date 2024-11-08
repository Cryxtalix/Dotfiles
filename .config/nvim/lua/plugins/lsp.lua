return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Add languages
        ensure_installed = {
          "bashls",
          "clangd",
          "lua_ls",
          "marksman",
          "pyright",
          "rust_analyzer",
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.marksman.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})

      -- Key mapping
      -- Hover for definition
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

      -- Move to definition
      vim.api.nvim_create_user_command(
        "Goto",
        function()
          vim.lsp.buf.definition()
        end,
        {}
      )

      -- Code action
      vim.api.nvim_create_user_command(
        "Codeact",
        function()
          vim.lsp.buf.code_action()
        end,
        {}
      )
    end
  }
}
