return {
  "saghen/blink.cmp",
  version = not vim.g.lazyvim_blink_main and "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "saghen/blink.compat",
      optional = true,
      opts = {},
      version = not vim.g.lazyvim_blink_main and "*",
    },
  },
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },

  ---@type blink.cmp.Config
  opts = {
    snippets = {
      expand = function(snippet, _)
        return LazyVim.cmp.expand(snippet)
      end,
    },

    completion = {
      trigger = {
        show_on_keyword = true,
        show_on_insert = false, -- 🚫 stops annoying auto-popup on every char
      },
      accept = {
        auto_brackets = { enabled = true },
        create_undo_point = true,
      },
      menu = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 80, -- ⚡ a bit faster
        window = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        },
      },
      ghost_text = { enabled = true }, -- 👻 inline preview
    },

    appearance = {
      use_nvim_cmp_as_default = true,
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

    sources = {
      default = { "lsp", "buffer", "snippets", "path" },
    },

    cmdline = {
      enabled = true,
      keymap = { preset = "inherit" },
      completion = {
        menu = { auto_show = true },
        list = { selection = { preselect = false } },
      },
    },

    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
      [";"] = { "cancel", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next" }, -- 👆 classic nvim-cmp vibe
      ["<C-p>"] = { "select_prev" },
      ["<C-e>"] = { "cancel" }, -- quick escape
    },
  },

  config = function(_, opts)
    -- compat sources handling
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end
    opts.sources.compat = nil

    -- inject custom kind icons if provider has "kind"
    for _, provider in pairs(opts.sources.providers or {}) do
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1

        CompletionItemKind[kind_idx] = provider.kind
        CompletionItemKind[provider.kind] = kind_idx

        local transform_items = provider.transform_items
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
            item.kind_icon = LazyVim.config.icons.kinds[item.kind_name] or item.kind_icon or nil
          end
          return items
        end

        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}

