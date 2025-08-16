return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },

        ruff = {},

        html = {
          filetypes = { "html", "htmldjango", "django-html" },
        },
      },

      setup = {
        html = function(_, opts)
          local on_attach = opts.on_attach
          opts.on_attach = function(client, bufnr)
            -- disable formatting since you’ll likely use prettier/null-ls
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- call original on_attach if present
            if on_attach then
              on_attach(client, bufnr)
            end
          end
          return false -- let default setup continue
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "html-lsp",
        "djlint",
        "django-template-lsp",
      },
    },
  },
}
