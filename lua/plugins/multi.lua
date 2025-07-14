return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = false,
  init = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap

    map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)
    map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
    map("n", "<C-d>", "<Plug>(VM-Find-Under)", opts)
    map("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", opts)
    map("n", "<C-S-d>", "<Plug>(VM-Select-All-Under)", opts)
    map("v", "<C-S-d>", "<Plug>(VM-Select-All-Subword-Under)", opts)
    map("n", "<Leader>m", ":VMToggle<CR>", { noremap = true, silent = true })
  end,
}
