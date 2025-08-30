return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
      },
    },
 explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
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
