return {
  "stevearc/oil.nvim",
  opts = {
    columns = {}, -- remove icon and permissions columns
    float = {
      padding = 2,
      max_width = 60,
      max_height = 20,
      border = "rounded",
    },
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<Esc>"] = "actions.close",
    },
  },
  keys = {
    { "=", "<cmd>Oil<CR>", desc = "Open Filesystem" },
    { "-", "<cmd>Oil --float<CR>", desc = "Open Floating Filesystem" },
  },
}
