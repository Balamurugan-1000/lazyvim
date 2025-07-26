vim.filetype.add({
  pattern = {
    ["[^/]+/templates/.+%.html"] = "htmldjango",
    [".*/templates/.+%.html"] = "htmldjango", -- fallback for deeper nesting
  },
})
