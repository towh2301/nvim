return {
  "epwalsh/obsidian.nvim",
  version = "*", -- latest release
  lazy = true,
  -- Load only when opening a markdown file INSIDE your vault
  event = {
    "BufReadPre " .. vim.fn.expand("~/Notes") .. "/**.md",
    "BufNewFile " .. vim.fn.expand("~/Notes") .. "/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Notes",
      },
    },
    -- Keep the rest of your options (daily_notes, completion, etc.)
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
    },
    preferred_link_style = "wiki",
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      enable = true,
    },
    -- Your mappings, etc.
  },
}
