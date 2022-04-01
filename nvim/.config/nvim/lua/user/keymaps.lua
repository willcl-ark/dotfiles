local opts = { noremap = true, silent = true }
--local cur_buf_opts = { noremap = true, silent = true, buffer = 0 }

-- local term_opts = { silent = true }

-- Shorten function names
local keymap = vim.api.nvim_set_keymap
local buffer_keymap = vim.api.nvim_buf_set_keymap

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

-- LSP shortcuts found in lsp/handlers.lua

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
keymap("n", "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
keymap("n", "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)

keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>to", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
keymap("n", "<leader>ch", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
keymap("n", "<leader>sh", "<cmd>lua require('telescope.builtin').search_history()<cr>", opts)
keymap("n", "<leader>ht", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua require('telescope.builtin').resume()<cr>", opts)
keymap("n", "<leader>tb", "<cmd>lua require('telescope.builtin').builtin()<cr>", opts) -- show all pickers
keymap("n", "<leader>=", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>", opts)

keymap("n", "<leader><leader>s", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)  -- lsp workspace symbols
keymap("n", "<leader>lca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)  -- lsp code actions
