return {
  "saghen/blink.cmp",
  lazy = false, -- bật ngay khi khởi động (LazyVim sẽ tự load ở InsertEnter)
  version = "*", -- luôn dùng phiên bản mới nhất
  build = "cargo build --release",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      -- Đây là preset ĐƯỢC KHUYẾN CÁO MẠNH NHẤT trong cộng đồng LazyVim 2025
      preset = "super-tab", -- Tab để chọn + accept, giống VSCode 100%

      -- Nếu bạn vẫn thích Enter để accept thì đổi thành "enter"
      -- preset = "enter",

      -- Một vài custom nhẹ (không bắt buộc, preset đã rất tốt rồi)
      ["<C-space>"] = { "show", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono", -- đẹp và thẳng hàng nhất
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true }, -- tự động thêm ), ], } khi accept
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
      ghost_text = { enabled = true },
    },

    sources = {
      -- LSP và path luôn ở trên cùng → ưu tiên cao nhất
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = {
      -- Rust matcher cực nhanh + chịu lỗi chính tả cực tốt
      implementation = "prefer_rust_with_warning",
    },

    -- Cmdline (: / ?) cũng có completion ngon lành
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
    },
  },

  -- Phần này bắt buộc để LazyVim hiểu đây là plugin có opts
  config = function(_, opts)
    -- Nếu dùng LazyVim extras (có LazyVim.cmp.expand)
    if LazyVim and opts.snippets == nil then
      opts.snippets = { preset = "default", expand = LazyVim.cmp.expand }
    end

    require("blink.cmp").setup(opts)
  end,
}
