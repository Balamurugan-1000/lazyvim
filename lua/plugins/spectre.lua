-- ~/.config/nvim/lua/plugins/spectre.lua

return {
  -- plenary is usually a dependency and already included by LazyVim
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Spectre" }, -- lazy load on command
    keys = {
      { "<leader>sr", "<cmd>Spectre<CR>", desc = "Replace in files (Spectre)" },
    },
    config = function()
      require("spectre").setup()
    end,
  },
}

