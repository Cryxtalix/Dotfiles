-- Language server for specified languages
-- Hover with 'K'
-- Goto definition with :Goto
-- Open code action with :Codeact

local servers = {
  "lua_ls", "bashls", "clangd", "marksman", "pyright", "lemminx",
}

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
        ensure_installed = servers,
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
      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
        }
      end

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
