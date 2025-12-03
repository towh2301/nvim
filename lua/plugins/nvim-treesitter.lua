return {
  -- 1. Configure Treesitter (Syntax Highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    -- We simply extend the existing options.
    -- LazyVim automatically merges this list with its defaults.
    opts = {
      ensure_installed = {
        -- Base
        "bash",
        "vim",
        -- "lua",
        "luadoc",
        "regex",
        "markdown",
        "markdown_inline",
        "diff",
        "gitignore",
        "query",

        -- Web Development (React, JS, TS, HTML, CSS)
        "javascript",
        "typescript",
        "tsx", -- Essential for React
        "html",
        "css",
        "scss",
        "json",
        "jsonc",

        -- Backend / Fullstack
        "python",
        "java",
        "c",
        "cpp",
        "sql",
        "dockerfile",

        -- Config Files
        "yaml",
        "toml",
      },
      -- Enable standard features
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- 2. Add Auto-tagging (Essential for React/HTML)
  -- This automatically closes tags like <div> -> </div>
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },
}
