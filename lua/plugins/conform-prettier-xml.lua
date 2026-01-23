-- lua/plugins/conform-prettier-xml.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      xml = { "prettier" },
    },
  },
}
