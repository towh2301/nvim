return {
  "saghen/blink.cmp",
  lazy = false,
  version = "*",
  build = "cargo build --release",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      preset = "super-tab", -- vẫn là preset tốt nhất, giống VSCode

      ["<C-space>"] = { "show", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
      ghost_text = { enabled = true },
    },

    -- Phần này là đúng và ưu tiên LSP + path cao nhất
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      compat = { "emoji", "vimtex" },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },

    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
    },
  },

  config = function(_, opts)
    if LazyVim and opts.snippets == nil then
      opts.snippets = { preset = "default", expand = LazyVim.cmp.expand }
    end

    require("blink.cmp").setup(opts)
  end,
}
