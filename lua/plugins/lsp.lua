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
          opts.on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
          end
          return false -- allow default setup to continue
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "html",
        "htmldjango",
        "css",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
