return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = "⚡", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = {
          pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
          icon = "",
          lang = "lua",
        },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = { view = "cmdline_input", icon = "󰥻 " },
      },
    },

    popupmenu = {
      enabled = false,
    },
    lsp = {
      hover = {
        enabled = true,
        silent = true,
        opts = { border = "rounded" },
      },
      signature = {
        enabled = true,
        auto_open = { enabled = true, trigger = true, luasnip = true },
        opts = { border = "rounded" },
      },
      documentation = {
        view = "hover",
        opts = { border = "rounded" },
      },
    },
  },
}
