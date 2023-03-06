return {
  setup = function()
    -- See `:help vim.o`
    local opt = vim.opt

    -- Set highlight on search
    opt.hlsearch = false

    -- Make line numbers default
    vim.opt.number = true
    -- Use relative numbers
    vim.opt.relativenumber = true
    -- Don't show less than 8 lines of context
    vim.opt.scrolloff = 8

    -- Always show sign column to avoid text shifting
    vim.opt.signcolumn = "yes"

    -- Don't wrap unless we call :wrap
    opt.wrap = false

    -- Split in sane ways
    opt.splitbelow = true
    opt.splitright = true

    -- Tab settings
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.tabstop = 4
    opt.softtabstop = 4

    -- Use bash as shell instead of fish
    opt.shell = os.getenv("BASH")

    -- Enable mouse mode
    opt.mouse = "a"

    -- Enable break indent
    opt.breakindent = true

    -- Save undo history
    opt.undofile = true

    -- Case insensitive searching UNLESS /C or capital in search
    opt.ignorecase = true
    opt.smartcase = true

    -- Decrease update time
    opt.updatetime = 250

    -- Set colorscheme
    opt.termguicolors = true
    vim.cmd([[colorscheme catppuccin]])

    -- Show `` in markdown files
    opt.conceallevel = 0

    -- Highlight current line
    opt.cursorline = true

    -- Set completeopt to have a better completion experience
    opt.completeopt = "menuone,noselect"

    -- Python venv
    vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim2/bin/python"
    vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim3/bin/python"

    -- Use system clipboard
    opt.clipboard = "unnamedplus"

    -- Show trailing whitespace
    opt.listchars = "trail:~,tab:>-,nbsp:␣"
    opt.list = true

    -- Unified status bar for all splits
    opt.laststatus = 3

    -- Don't show mode as we use status line
    opt.showmode = false

    -- use bear to Make
    opt.makeprg = "bear -- make -j16"
  end,
}
