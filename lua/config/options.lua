vim.g.autoformat = false
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
vim.g.snacks_animate = false
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.swapfile = false
-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
vim.filetype.add({
  pattern = {
    ["[^/]+/templates/.+%.html"] = "htmldjango",
    [".*/templates/.+%.html"] = "htmldjango", -- fallback for deeper nesting
  },
})
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#f8f8f2" })  -- brighter text
vim.api.nvim_set_hl(0, "Comment", { fg = "#8aff80", italic = true })  -- neon green comments
