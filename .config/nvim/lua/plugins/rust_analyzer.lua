-- https://github.com/mrcjkb/rustaceanvim

return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          default_settings = {
            -- rust-analyzer language server configuration
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
              }
            },
          },
        },
        -- DAP configuration
        dap = {
        },
      }
    end
  },
}
