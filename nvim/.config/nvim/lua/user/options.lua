local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = true,                       -- ignore case in search patterns
  gdefault = true,
  mouse = "a",                             -- allow the mouse to be used in neovim
  ttyfast = true,
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabs
  -- guitablabel = "%F %y",
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 250,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop = 4,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "80",
  wrap = true,                             -- display lines as one long line
  linebreak = true,
  scrolloff = 2,                           -- How many lines to keep visible
  sidescrolloff = 2,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
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

