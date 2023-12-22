local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap -- for conciseness

-- set leader key to space
-- keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

keymap.set("i", "jk", "<ESC>", opts)
keymap.set("n", "ee", "<S-w>$", opts) -- move cursor to end of lines
keymap.set("n", "ff", "0", opts) -- move cursor to begin of line
keymap.set("v", "ff", "0", opts) -- move cursor to begin of line
keymap.set("v", "ee", "<S-w>$", opts) -- move cursor to begin of line

-- window management
keymap.set("n", "sv", "<C-w>v") -- split window vertically
keymap.set("n", "sh", "<C-w>s") -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sc", ":close<CR>") -- close current split window

-- tab management
-- keymap.set("n", "to", ":tabnew<cr>", opts) -- open new tab
-- keymap.set("n", "tc", ":tabclose<cr>", opts) -- close current tab
-- keymap.set("n", "tn", ":tabn<cr>", opts) -- go to next tab
-- keymap.set("n", "tp", ":tabp<CR>", opts) -- go to previous tab

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits ( use <cr> to checkout ) [ "gc" for git commits ]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer ( use <cr> to checkout ) [ "gfc" for git file commits ]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches ( use <cr> to checkout ) [ "gb" for git branch ]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current woriking directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) --slist available help tags
