local options = {
  ----------------------
  -- BACKUP
  ----------------------
  backup = true,                           -- creates a backup file
  backupdir = '/tmp//',                    -- directory for backups
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  directory = '/tmp//',                    -- directory for the swap file
  swapfile = true,                         -- creates a swapfile
  undofile = true,                         -- enable persistent undo
  undodir = '/tmp//',                      -- directory for undo data
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  ----------------------
  -- DISPLAY
  ----------------------
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  colorcolumn = "80",                      -- show a coloured column
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  -- guitablabel = "%F %y",
  linebreak = true,
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 4
  pumheight = 10,                          -- pop up menu height
  relativenumber = true,                   -- set relative numbered lines
  -- scrolloff = 2,                           -- How many lines to keep visible
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabs
  sidescrolloff = 2,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  ----------------------
  -- MISC
  ----------------------
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = true,                       -- ignore case in search patterns
  gdefault = true,
  mouse = "a",                             -- allow the mouse to be used in neovim
  -- ttyfast = true,                          -- Removed
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop = 4,
  shell = os.getenv("BASH"),               -- use bash shell for internals
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- switch venv path based on OS
local sysname = vim.loop.os_uname().sysname
if sysname == "Linux" then vim.g.python_host_prog = "/home/will/.pyenv/versions/neovim2/bin/python"
elseif sysname == "Darwin" then vim.g.python_host_prog = "/Users/will/.pyenv/versions/nvim2/bin/python"
end
if sysname == "Linux" then vim.g.python3_host_prog = "/home/will/.pyenv/versions/neovim3/bin/python"
elseif sysname == "Darwin" then vim.g.python3_host_prog = "/Users/will/.pyenv/versions/nvim3/bin/python"
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

