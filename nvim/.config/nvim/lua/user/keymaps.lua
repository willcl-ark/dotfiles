local opts = { noremap = true, silent = true }
local cur_buf_opts = { noremap = true, silent = true, buffer = 0 }

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

-- LSP shortcuts
keymap("n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)  -- lsp definitions
keymap("n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)   -- lsp references
keymap("n", "<leader>li", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)  -- lsp implmentations
vim.keymap.set("n", "K", vim.lsp.buf.hover, cur_buf_opts ) -- show function signature

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
keymap("n", "<leader>th", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>tr", "<cmd>lua require('telescope.builtin').resume()<cr>", opts)
keymap("n", "<leader>tp", "<cmd>lua require('telescope.builtin').builtin()<cr>", opts) -- show all pickers

