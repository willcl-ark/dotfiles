-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
-- Use relative numbers
vim.wo.relativenumber = true
-- Don't show less than 8 lines of context
vim.wo.scrolloff = 8

-- Always show sign column to avoid text shifting
vim.o.signcolumn = "yes"

-- Don't wrap unless we call :wrap
vim.o.wrap = false

-- Split in sane ways
vim.o.splitbelow = true
vim.o.splitright = true

-- Tab settings
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Use bash as shell instead of fish
vim.o.shell = os.getenv("BASH")

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Add a color column
vim.o.colorcolumn = "80"

-- Show `` in markdown files
vim.o.conceallevel = 0

-- Highlight current line
vim.o.cursorline = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Python venv
vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim3/bin/python"

-- Use system clipboard
vim.o.clipboard = "unnamedplus"
