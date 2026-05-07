vim.pack.add({
  {
    src = 'https://github.com/mrcjkb/rustaceanvim.git',
    version = 'master',
    lazy = false, -- This plugin is already lazy
  },
})

vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      -- https://rust-analyzer.github.io/book/configuration.html
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = {
          enable = true,
          command = "clippy",
          features = "all",
        },
        completion = {
          autoimport = {
            enable = false;
          }
        },
        files = {
          exclude = {
            "build-dir/",
            ".flatpak-builder",
          }
        }
        --settings = {
        --  cargo = { allFeatures = true },
        --  imports = { group = { enable = false } },
        --  completion = { postfix = { enable = false } },
        --  -- https://www.reddit.com/r/rust/comments/1e978l7/comment/led7ibp/
        --  -- checkOnSave = { command = "clippy" },
        --  checkOnSave = { command = false },

        --  diagnostics = { enable = true },
        --  rustfmt = { enable = true },
        --}
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}
