return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- or "night", "storm", "day"
      light_style = "day",
      transparent = true, -- ✅ enable full transparency
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent", -- ✅ make sidebars transparent
        floats = "transparent", -- ✅ make floating windows transparent
      },
      day_brightness = 0.8,
      dim_inactive = false,
      lualine_bold = true,

      on_colors = function(colors) end,

      on_highlights = function(hl, c)
        hl.Normal = { bg = "NONE" }
        hl.NormalNC = { bg = "NONE" }
        hl.NormalFloat = { bg = "NONE" }
        hl.FloatBorder = { bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
        hl.StatusLine = { bg = "NONE" }
        hl.VertSplit = { bg = "NONE" }
        hl.EndOfBuffer = { bg = "NONE" }
      end,

      plugins = {
        all = true,
        auto = true,
      },
    },
  },

  { "shaunsingh/nord.nvim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
}
