-- lua/plugins/mason.lua
return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- Full-stack + C/C++ + Java + Python (no lua_ls!)
      ensure_installed = {
        -- Full-stack Web
        "ts_ls", -- TypeScript/JavaScript
        "html",
        "cssls",
        "tailwindcss",
        "prismals", -- Prisma

        -- Python
        "pyright", -- Fast Python LSP

        -- C / C++
        "clangd", -- Best C/C++ LSP

        -- Java
        "jdtls", -- Eclipse JDT Language Server (Java)

        -- Optional nice-to-have
        "jsonls",
        "marksman", -- Markdown
        "bashls",
      },

      -- Keep automatic installation ON for everything EXCEPT lua_ls
      automatic_installation = { exclude = { "lua_ls" } },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "prettier", -- JS/TS/HTML/CSS/JSON
        "stylua", -- Lua
        "black", -- Python
        "clang-format", -- C/C++
        "google-java-format", -- Java

        -- Linters
        "eslint_d", -- JS/TS
        "pylint", -- Python (optional if using ruff)
        "cpplint", -- C/C++ style checker
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
