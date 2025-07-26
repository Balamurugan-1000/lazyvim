return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = true,
  lazy = true,
  opts = function()
    local tokyonight = require("lualine.themes.tokyonight")

    -- Make background transparent
    for _, section in pairs(tokyonight) do
      for _, hl in pairs(section) do
        hl.bg = "NONE"
      end
    end

    return {
      options = {
        theme = tokyonight,
        globalstatus = true,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "alpha", "dashboard", "starter", "neo-tree" },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 0,
            symbols = {
              modified = " ●",
              readonly = " 🔒",
              unnamed = "😒",
              newfile = " ",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
            always_visible = true,
          },
          { "filetype", icon_only = true },
          { "fileformat" },
        },
        lualine_y = {
          {
            "location",
          },
        },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 0,
            symbols = {
              modified = " ●",
              readonly = " 🔒",
              unnamed = "😒",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
