return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },

    completion = {
      menu = {
        border = "rounded",
        scrollbar = false, -- 🚫 no scrollbar
        winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
          zindex = 50, -- keeps above cmp menu
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true, -- prettier formatting
      kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      },
    },
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#89b4fa", bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "CmpSel", { bg = "#313244", fg = "#cdd6f4", bold = true })
    vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#181825", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#89b4fa", bg = "#181825" })
  end,
}
