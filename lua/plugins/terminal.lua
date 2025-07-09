return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<A-1>", function() _term1:toggle() end, desc = "ToggleTerm 1" },
    { "<A-2>", function() _term2:toggle() end, desc = "ToggleTerm 2" },
    { "<A-3>", function() _term3:toggle() end, desc = "ToggleTerm 3" },
    { "<A-4>", function() _term4:toggle() end, desc = "ToggleTerm 4" },
    { "<A-5>", function() _term5:toggle() end, desc = "ToggleTerm 5" },
  },
  opts = {
    direction = "float",
    open_mapping = nil,
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    persist_mode = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local Terminal = require("toggleterm.terminal").Terminal
    _term1 = Terminal:new({ count = 1 })
    _term2 = Terminal:new({ count = 2 })
    _term3 = Terminal:new({ count = 3 })
    _term4 = Terminal:new({ count = 4 })
    _term5 = Terminal:new({ count = 5 })
  end,
}

