return {
  -- Tokyonight (active)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
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

  -- Rose Pine (active)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        dark_variant = "moon",
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
        highlight_groups = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          VertSplit = { bg = "none" },
          SignColumn = { bg = "none" },
          StatusLine = { bg = "none" },
          bufferLine = { bg = "none" },
        },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  -- Gruvbox (active)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      terminal_colors = true,
      contrast = "hard",
      transparent_mode = true,
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Everforest
  {
    "sainnhe/everforest",
    lazy = true,
  },

  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },

  -- Edge (Sonokai's sibling)
  {
    "sainnhe/edge",
    lazy = true,
  },

  -- Sonokai
  {
    "sainnhe/sonokai",
    lazy = true,
  },

  -- Melange
  {
    "savq/melange-nvim",
    lazy = true,
  },

  -- Onedark
  {
    "navarasu/onedark.nvim",
    lazy = true,
  },

  -- Monokai Pro
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
  },

  -- Carbonfox (Nightfox family)
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  -- Dracula
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },

  -- Oxocarbon (IBM Carbon Theme)
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },

  -- Base16
  {
    "RRethy/nvim-base16",
    lazy = true,
  },

  -- Github Dark
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
  },

  -- Minimal Misty
  {
    "Yazeed1s/minimal.nvim",
    lazy = true,
  },

  -- Doom One
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = true,
  },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },

  -- Nightfly
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    name = "nightfly",
  },

  -- OneMonokai
  {
    "cpea2506/one_monokai.nvim",
    lazy = true,
  },
}
