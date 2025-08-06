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
        local file = vim.api.nvim_buf_get_name(0)
        local dir = vim.fn.fnamemodify(file, ":h")
        require("snacks.picker").explorer({ cwd = dir }) -- ✅ use cwd instead of cd
      end,
      desc = "Snacks Explorer (file's dir)",
    },

    {
      "<leader>ce",
      function()
        local dir = "~/.config/nvim/"
        require("snacks.picker").explorer({ cwd = dir }) -- ✅ use cwd instead of cd
      end,
      desc = "Snacks Explorer (file's dir)",
    },
  },
}
