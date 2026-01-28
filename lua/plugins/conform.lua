return {
  "stevearc/conform.nvim",
  opts = {},

  require("conform").setup({
    formatters_by_ft = {
      -- Leave this empty or nil for xml
      xml = {},
    },

    -- This is the key part:
    format_on_save = {
      timeout_ms = 500,
      -- "fallback": Use LSP if no other formatter is defined in formatters_by_ft
      lsp_format = "fallback",
    },
  }),
}
