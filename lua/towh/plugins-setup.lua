-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- "plugins-setup.lua" is your file name
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safety
-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- add list of plugins to install
return require("packer").startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- MY PLUGINS HERE
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- lua function that many plugins use

  -- themes
  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme - ( optional - will be replaced soon )
  use("folke/tokyonight.nvim") -- tokyonight
  use("nyoom-engineering/oxocarbon.nvim") -- oxocarbon colorscheme
  use("EdenEast/nightfox.nvim") -- nightfox colorscheme
  use("navarasu/onedark.nvim") -- onedark colorscheme
  use({ "projekt0n/github-nvim-theme" })

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigator

  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explore
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding with telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actionslsp code actions

  -- file browser with telescope-file-browser
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  })

  -- auto completion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & performatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap between mason & lspconfig
  use({
    "ray-x/lsp_signature.nvim",
  })

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure langueage server
  use("hrsh7th/cmp-nvim-lsp") -- for autocomplete
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript
  use("onsails/lspkind.nvim") -- vs-code line icons for autocompletion
  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  })

  -- formating & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parents, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modification on left hand side
  -- terminal with toggleterm
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
  })
  -- debug adapter
  use("mfussenegger/nvim-dap")
  -- for python
  use({
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependency = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  })
  ------
  use("rcarriga/nvim-dap-ui")
  -- use("williamboman/mason.nvim") -- previousl installed
  use("jay-babu/mason-nvim-dap.nvim")

  --------- PLUGINS FOR DAP ----------

  use("leoluz/nvim-dap-go") -- dap for GO language

  ------------------------------------

  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- startup nvim custom
  use({
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "PackerSync", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            -- {
            --   desc = " Apps",
            --   group = "DiagnosticHint",
            --   action = "Telescope app",
            --   key = "a",
            -- },
            -- {
            --   desc = " dotfiles",
            --   group = "Number",
            --   action = "Telescope dotfiles",
            --   key = "d",
            -- },
          },
        },
      })
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- github copilot
  use({ "github/copilot.vim", branch = "release" })

  -- catppuccin
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- lsp
  use({
    "lewis6991/hover.nvim",
  })

  -- END OF MY PLUGINS

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
