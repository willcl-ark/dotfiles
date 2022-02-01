local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap : to ;
keymap("n", ";", ":", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Jump to start and end of line using homerow keys
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Clear search highlighting with ctrl+l
keymap("n", "<C-l>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Bring up a nice buffer switcher with F5
keymap("n", "<F5>", ":buffers<CR>:buffer<Space>", opts)

-- Direct LSP shortcuts
keymap("n", "gd", "Telescope lsp_definitions<cr>", opts) -- jump to definition
keymap("n", "gr", "Telescope lsp_references<cr>", opts) -- list references
