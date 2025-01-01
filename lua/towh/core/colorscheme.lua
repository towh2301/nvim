-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local cmd = vim.cmd

-- solarized osaka
local solarized_status, solarized = pcall(require, "solarized-osaka")
if not solarized_status then
  print("solarized-osaka is not installed!")
  return
end

-- Default options for nightfox
local nightfox, fox = pcall(require, "nightfox")
if not nightfox then
  print("nightfox is not installed!")
  return
end
fox.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false, -- Non focused panes set to alternative background
    module_default = true, -- Default enable value for modules
    colorblind = {
      enable = false, -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 0, -- Severity [0,1] for protan (red)
        deutan = 0, -- Severity [0,1] for deutan (green)
        tritan = 0, -- Severity [0,1] for tritan (blue)
      },
    },
    styles = { -- Style to be applied to different syntax groups
      comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

------
-- ONE DARK
------
local one_status, one = pcall(require, "onedark")
if not one_status then
  print("onedark is not installed!")
  return
end

one.setup({
  style = "darker",
  transparent = true,
})

local tokyo_status, tokyo = pcall(require, "tokyonight")
if not tokyo_status then
  print("tokyonight is not installed!")
  return
end

tokyo.setup({
  transparent = false,
})

local nightfly_status, nighfly = pcall(require, "nightfly")
if not nightfly_status then
  print("nightfly is not installed!")
  return
end

local githubtheme_status, gittheme = pcall(require, "github-theme")
if not githubtheme_status then
  print("githubtheme is not installed!")
  return
end
gittheme.setup({
  options = {
    transparent = true,
  },
})

---------
--END ONE
---------

-- catppuccin
local cat_status, cat = pcall(require, "catppuccin")
if not cat_status then
  print("catppuccin is not installed!")
  return
end
cat.setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- nightfly setup
vim.g.nightflyTransparent = true

-- setup must be called before loading
cmd("colorscheme nightfly")
