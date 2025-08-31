-- Language server for specified languages
-- Hover with 'K'
-- Goto definition with :Goto
-- Open code action with :Codeact

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
      require("mason-lspconfig").setup {
        ensure_installed = { "bashls", "lua_ls", "clangd", "marksman", "pyright", "rust_analyzer", "lemminx" },
        automatic_installation = true,
      }
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Advertise autocompletion to lsp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.marksman.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })

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
