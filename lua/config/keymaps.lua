-- ===============================
-- 🌿 Neovim Keymaps Configuration
-- ===============================

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap

-- -----------------------------
-- Leader Key Configuration
-- -----------------------------
keymap.set("", "<Space>", "<Nop>", opts) -- disable default space key behavior
vim.g.mapleader = " " -- set <leader> to space

-- -----------------------------
-- General Keymaps
-- -----------------------------

keymap.set("i", "jk", "<ESC>", opts) -- exit insert mode quickly
keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- clear search highlights
keymap.set("n", "x", '"_x', opts) -- delete single char without copying

-- Move to beginning/end of line
keymap.set({ "n", "v" }, "<S-e>", "$", opts) -- go to end of line
keymap.set({ "n", "v" }, "<S-f>", "0", opts) -- go to beginning of line

-- -----------------------------
-- Window Management
-- -----------------------------
keymap.set("n", "sv", "<C-w>v", opts) -- split vertically
keymap.set("n", "sh", "<C-w>s", opts) -- split horizontally
keymap.set("n", "se", "<C-w>=", opts) -- equal size
keymap.set("n", "sc", ":close<CR>", opts) -- close current split

-- -----------------------------
-- Window Navigation
-- -----------------------------
keymap.set("n", "<leader>h", "<C-w>h", opts) -- move left
keymap.set("n", "<leader>j", "<C-w>j", opts) -- move down
keymap.set("n", "<leader>k", "<C-w>k", opts) -- move up
keymap.set("n", "<leader>l", "<C-w>l", opts) -- move right

-- -----------------------------
-- Window Resizing
-- -----------------------------
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- -----------------------------
-- Tab Management
-- -----------------------------
keymap.set("n", "to", ":tabnew<CR>", opts)
keymap.set("n", "tc", ":tabclose<CR>", opts)
keymap.set("n", "tn", ":tabn<CR>", opts)
keymap.set("n", "tp", ":tabp<CR>", opts)

-- -----------------------------
-- Visual Mode Enhancements
-- -----------------------------
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "p", '"_dP', opts)

-- -----------------------------
-- Buffer Navigation
-- -----------------------------
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- -----------------------------
-- Visual Block Mode
-- -----------------------------
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- -----------------------------
-- Plugin Integrations
-- -----------------------------

-- Maximizer (toggle split maximization)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Neotree (file explorer)
keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)
keymap.set("n", "<leader>o", ":Neotree focus<CR>", opts)

-- Markdown preview
keymap.set("n", "<leader>md", ":MarkdownPreview<cr>", opts)

-- -----------------------------
-- Java Development (nvim-java)
-- -----------------------------

-- Build / Workspace
keymap.set("n", "<leader>jb", ":JavaBuildBuildWorkspace<CR>", opts) -- build Java workspace
keymap.set("n", "<leader>jC", ":JavaBuildCleanWorkspace<CR>", opts) -- clean Java workspace

-- Run / Stop
keymap.set("n", "<leader>jr", ":JavaRunnerRunMain<CR>", opts) -- run main class
keymap.set("n", "<leader>js", ":JavaRunnerStopMain<CR>", opts) -- stop running main
keymap.set("n", "<leader>jl", ":JavaRunnerToggleLogs<CR>", opts) -- toggle runner logs
keymap.set("n", "<leader>jL", ":JavaRunnerSwitchLogs<CR>", opts) -- switch runner logs view

-- Tests
keymap.set("n", "<leader>jtc", ":JavaTestRunCurrentClass<CR>", opts) -- run tests in current class
keymap.set("n", "<leader>jtm", ":JavaTestRunCurrentMethod<CR>", opts) -- run test under cursor
keymap.set("n", "<leader>jdc", ":JavaTestDebugCurrentClass<CR>", opts) -- debug current test class
keymap.set("n", "<leader>jdm", ":JavaTestDebugCurrentMethod<CR>", opts) -- debug current test method
keymap.set("n", "<leader>jtr", ":JavaTestViewLastReport<CR>", opts) -- view last test report

-- Refactoring
keymap.set("n", "<leader>jec", ":JavaRefactorExtractConstant<CR>", opts) -- extract constant
keymap.set("n", "<leader>jef", ":JavaRefactorExtractField<CR>", opts) -- extract field
keymap.set("n", "<leader>jem", ":JavaRefactorExtractMethod<CR>", opts) -- extract method
keymap.set("n", "<leader>jev", ":JavaRefactorExtractVariable<CR>", opts) -- extract variable
keymap.set("n", "<leader>jeV", ":JavaRefactorExtractVariableAllOccurrence<CR>", opts) -- extract variable (all)

-- Profiling / Config
keymap.set("n", "<leader>jp", ":JavaProfile<CR>", opts) -- profile Java application
keymap.set("n", "<leader>jd", ":JavaDapConfig<CR>", opts) -- open DAP config
keymap.set("n", "<leader>jS", ":JavaSettingsChangeRuntime<CR>", opts) -- change Java runtime
