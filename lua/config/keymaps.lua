local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)
map("n", "<leader>w", ":w <CR>", opts)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-a>", "ggVG", opts)
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>se", ":e ~/scratch.txt <CR>", { desc = "Open a persisant buffer." })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader><leader>", "<nop>", opts)
map("n", "<ESC><ESC>", ":nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })
map("i", "jj", "<ESC>", { desc = "To normal mode", noremap = true, silent = true })
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "x", '"_x', { noremap = true, silent = true })
map("v", "x", '"_x', { noremap = true, silent = true })
map({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
map("n", "<leader>uj", function()

  vim.g.diagnostics_hover_enabled = not vim.g.diagnostics_hover_enabled
  local msg = vim.g.diagnostics_hover_enabled and "Enabled" or "Disabled"
  vim.notify("Diagnostics hover: " .. msg, vim.log.levels.INFO, { title = "LSP Hover" })
end, { desc = "Toggle diagnostics hover on cursor" })

