-- For Rust
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    config = function()
      -- Configure rustaceanvim
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = {
            auto_insert = true,
          },
          code_action_group = true,
        },
        server = {
          on_attach = function(client, bufnr)
            -- Enable inlay hints
            if vim.fn.has("nvim-0.10") == 1 then
              if client.supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
              end
            end
          end,
          default_settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                disable = { "unlinked-file" },
              },
              checkOnSave = {
                command = "clippy",
              },
              inlayHints = {
                enable = true,
                showParameterNames = true,
                parameterHintsPrefix = "→ ",
                chainingHints = true,
                chainingHintsSeparator = " → ",
                typeHints = true,
                typeHintsSeparator = " = ",
                typeHintsWithDuplicates = true,
                lifetimeElisionHints = {
                  enable = true,
                  useParameterNames = true,
                },
                closureReturnTypeHints = {
                  enable = true,
                },
              },
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
      -- Use latest edition
      vim.g.rust_recommended_style = 1
    end,
  },

  -- Extra Rust tools
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = true,
  },
}
