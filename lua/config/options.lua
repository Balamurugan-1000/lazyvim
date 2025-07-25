vim.g.autoformat = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.laststatus = 0
vim.o.list = false
vim.opt.listchars = {}
vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
vim.o.breakindent = true
if vim.loader then
  vim.loader.enable()
end
vim.opt.foldenable = false
vim.o.winblend = 0
vim.o.pumblend = 0

vim.filetype.add({
  pattern = {
    ["[^/]+/templates/.+%.html"] = "htmldjango",
    [".*/templates/.+%.html"] = "htmldjango", -- fallback for deeper nesting
  },
})
