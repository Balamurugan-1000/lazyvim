return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- For Python & Django
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },

        -- Optional: Or use `basedpyright` instead of `pyright`
        -- basedpyright = {},

        -- For HTML (Django templates too, but won't understand Django-specific tags)
        html = {},

        -- Emmet support
        emmet_ls = {
          filetypes = {
            "html",
            "htmldjango",
            "django-html",
            "css",
            "scss",
            "javascript",
            "typescript",
          },
        },
      },

      setup = {
        -- Optional: For custom `on_attach` behavior per server
      },
    },
  },
}
