return {
  -- ✅ Active theme
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
      },
      day_brightness = 1.8,
      dim_inactive = false,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
      
      -- Apply subtle transparency (around 10–15%)
      local alpha = 0.90 -- tweak between 0.85–0.95 for your liking
      local function blend(color)
        local hex = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(color)), "bg#")
        if hex == "" then return end
        vim.api.nvim_set_hl(0, color, { bg = "none" })
      end

      -- Transparent key UI groups
      blend("Normal")
      blend("NormalNC")
      blend("NormalFloat")
      blend("SignColumn")
      blend("VertSplit")
      blend("StatusLine")
      blend("StatusLineNC")
      blend("Pmenu")
      blend("TabLine")
      blend("TabLineFill")
      blend("TabLineSel")
    end,
  },

  -- ✅ Optional installed themes (not loaded unless you call :colorscheme manually)
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },

  -- Keep LazyVim config last
  { "LazyVim/LazyVim", opts = {} },
}

