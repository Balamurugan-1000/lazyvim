-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pp", function()
  require("pets").toggle()
end, { desc = "Toggle Pet" })
-- 🔃 Refresh diagnostics and open quickfix
map("n", "<leader>lD", function()
  vim.diagnostic.reset()
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, vim.tbl_extend("force", opts, { desc = "Refresh Diagnostics + Show Quickfix" }))

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- 🌳 Reattach Treesitter highlight
map("n", "<leader>lt", function()
  vim.cmd("TSBufDisable highlight")
  vim.cmd("TSBufEnable highlight")
end, vim.tbl_extend("force", opts, { desc = "Reattach Treesitter Highlight" }))

-- 🧼 Clear LSP diagnostics and highlights
map("n", "<leader>lc", function()
  vim.diagnostic.reset()
  vim.lsp.buf.clear_references()
end, vim.tbl_extend("force", opts, { desc = "Clear Diagnostics + Highlights" }))

map("n", "<leader>;", ":lua Snacks.dashboard() <CR>", opts)
map("n", "<C-a>", "ggVG", { desc = "Select entire buffer" })
map("n", "<C-u>", "<C-u>zz", { desc = "Select entire buffer" })
map("n", "<C-d>", "<C-d>zz", { desc = "Select entire buffer" })
map("n", "<ESC><ESC>", ":nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

-- map("n", "<C-w>", ":bd<CR>", { desc = "Close buffer", noremap = true, silent = true })
map("i", "jj", "<ESC>", { desc = "To normal mode", noremap = true, silent = true })

map("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", opts)
map("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", opts)
map("n", "<C-d>", "<Plug>(VM-Find-Under)", opts)
map("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<leader><leader>", "<nop>", opts)

local is_block = true

vim.keymap.set("n", "<leader>cb", function()
  if is_block then
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
    print("󰅖 Cursor: I-Beam Mode")
  else
    vim.opt.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
    print("󰛢 Cursor: BLOCK Mode")
  end
  is_block = not is_block
end, { desc = "Toggle Cursor Style" })

vim.keymap.set("n", "<leader>uj", function()
  vim.g.diagnostics_hover_enabled = not vim.g.diagnostics_hover_enabled
  local msg = vim.g.diagnostics_hover_enabled and "Enabled" or "Disabled"
  vim.notify("Diagnostics hover: " .. msg, vim.log.levels.INFO, { title = "LSP Hover" })
end, { desc = "Toggle diagnostics hover on cursor" })

-- Track closed buffer before deleting
local bufremove = require("mini.bufremove")
local buffer_history = require("util.buffer_history")

vim.keymap.set("n", "<leader>bd", function()
  buffer_history.on_buf_delete(0)
  bufremove.delete(0, false)
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>bu", function()
  require("util.buffer_history").reopen_last_buffer()
end, { desc = "Reopen Last Closed Buffer" })

-- -- -- Don't yank with x, c, C, s, S, d, D
-- local keys = { "x", "c", "C", "s", "S", "d", "D" }
--
-- for _, key in ipairs(keys) do
--   vim.keymap.set("n", key, '"_' .. key, { noremap = true, silent = true })
-- end
--
-- -- Also for visual mode
-- for _, key in ipairs({ "x", "d", "c" }) do
--   vim.keymap.set("v", key, '"_' .. key, { noremap = true, silent = true })
-- end
vim.keymap.set("n", "<leader>se", ":e ~/scratch.txt <CR>", { desc = "Open a persisant buffer." })

function ToggleDiagnostics()
  local enabled = false
  if vim.diagnostic.is_enabled then
    enabled = vim.diagnostic.is_enabled()
  elseif vim.diagnostic.is_disabled then
    enabled = not vim.diagnostic.is_disabled()
  end

  if vim.fn.has("nvim-0.10") == 0 then
    if not enabled then
      pcall(vim.diagnostic.enable)
    else
      pcall(vim.diagnostic.disable)
    end
  else
    vim.diagnostic.enable(not enabled)
  end

  print("Diagnostics " .. (enabled and "disabled" or "enabled"))
end

vim.keymap.set("n", "<leader>uB", ToggleDiagnostics, { desc = "Toggle LSP diagnostics" })

vim.keymap.set("n", "<leader>um", "<CMD>lua require('render-markdown').enable()<CR>", { desc = "ON Markdown Renderer" })

vim.keymap.set(
  "n",
  "<leader>uM",
  "<CMD>lua require('render-markdown').disable()<CR>",
  { desc = "OFF Markdown Renderer" }
)
