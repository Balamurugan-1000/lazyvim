return {
  -- Tokyonight (active)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      day_brightness = 1.8,
      dim_inactive = false,
      lualine_bold = true,
      plugins = {
        all = true,
        auto = true,
      }
    }
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      terminal_colors = true,
      contrast = "hard",
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}

