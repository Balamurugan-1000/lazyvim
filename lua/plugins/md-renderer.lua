return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      completions = {
        blink = { enabled = true },
      },
    },
    config = function(_, opts)
      local render = require("render-markdown")
      render.enable()
      render.setup(opts)
      -- vim.g.markdown_render_enabled = true
      -- vim
    end,
  },
}
