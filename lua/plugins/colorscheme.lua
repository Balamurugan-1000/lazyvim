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
      },
    },
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
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  }, -- Using Lazy
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      -- Enable theme
      require("onedark").load()
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Gruvbox Material settings 🌌
      vim.g.gruvbox_material_background = 'hard'  -- set contrast
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme('tokyonight-night')
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
    },
  },
}
