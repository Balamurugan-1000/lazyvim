return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = {
      enabled = true,
      win_opts = {
        row = vim.o.lines - 4, -- place 4 lines from the bottom
      },
    },
    picker = {
      enabled = true,
      backend = "telescope", -- 👈 USE TELESCOPE UI
      sources = {
        explorer = {
          -- hidden = true, -- 👈 show hidden dotfiles
          -- ignored = true, -- 👈 show .gitignored files
        },
      },
    },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
