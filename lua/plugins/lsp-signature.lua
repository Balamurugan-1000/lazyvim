return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  opts = {
    bind = true, -- mandatory for border styling
    floating_window = true, -- enable floating signature popup
    floating_window_above_cur_line = true, -- better UX for Python, avoids blocking code
    hint_enable = false, -- disable virtual text hint (cleaner)
    handler_opts = {
      border = "rounded", -- nicer floating window
    },
    -- Automatically show signature when typing trigger characters
    auto_close_after = 2, -- close the window after 2 seconds if no activity
    toggle_key = "<M-x>", -- optional: toggle signature help manually
    extra_trigger_chars = { "(", "," }, -- helpful for Python/Django/JS
    max_width = 80,
    max_height = 12,
    -- Delay to show the popup, avoid it being too eager
    timer_interval = 100,
    zindex = 200, -- ensures it floats above most UI
    -- fix for languages that use colon (like Python) breaking signatures
    fix_pos = true,
  },
}
