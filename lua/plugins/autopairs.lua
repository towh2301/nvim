return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({})

    -- Blink.cmp integration
    local blink = require("blink.cmp")
    blink.setup({
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },
    })
  end,
}
