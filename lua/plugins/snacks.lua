return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      keys = {},
    },
    indent = { enabled = true },
    input = {
      enabled = true,
      backend = "telescope",
    },
    picker = {
      enabled = false,
      backend = "telescope",
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("snacks.picker").explorer()
      end,
      desc = "Snacks Explorer (root dir)",
    },
    {
      "<leader>E",
      function()
        require("snacks.picker").explorer({ cwd = vim.fn.getcwd() })
      end,
      desc = "Snacks Explorer (cwd)",
    },
  },
}
