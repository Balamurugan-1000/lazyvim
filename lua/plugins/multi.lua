return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    -- Disable defaults if you want custom
    vim.g.VM_default_mappings = 0

    local opts = { noremap = true, silent = true }

    -- Add cursors up/down
    vim.api.nvim_set_keymap("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)
    vim.api.nvim_set_keymap("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)

    -- Find next occurrence
    vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(VM-Find-Under)", opts)
    vim.api.nvim_set_keymap("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", opts)
  end,
}
