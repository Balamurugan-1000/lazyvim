-- plugins/conform.lua
return {
  "stevearc/conform.nvim",
  enabled = true,
  opts = {
    formatters_by_ft = {
      python = { "black" },
      htmldjango = {},
      html = {},
    },
    formatters = {
      black = {
        prepend_args = {
          "--fast", -- optional, speeds up formatting
          "--target-version",
          "py311", -- ✅ set a valid version you use
        },
      },
    },
  },
}
