return {
  "rcarriga/nvim-notify",
  lazy = true,
  event = "VeryLazy",
  opts = {
    stages = "fade_in_slide_out",
    timeout = 2000,
    render = "minimal",
    background_colour = "#000000",
  },
  init = function()
    local notify = require("notify")

    -- 👇 override vim.notify to filter useless messages
    vim.notify = function(msg, ...)
      if
        type(msg) == "string"
        and (
          msg:find("No information available")
          or msg:find("No code actions available")
          or msg:find("Already up to date")
        )
      then
        return
      end
      notify(msg, ...)
    end
  end,
}
