-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Center after screen jump
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Center search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move highlighted lines
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' } )
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move hightligted lines up' } )

-- Sync OBC to server
vim.keymap.set('n', '<leader>so', ':!./sync<CR>', { desc = '[S]ync [O]BC' } )
vim.keymap.set('n', '<leader>ga', ':!asciidoctor -r asciidoctor-diagram --verbose --trace index.adoc<CR>', { desc = '[M]ake [A]sciidoctor' } )

-- Format via LSP
vim.keymap.set('n', '<leader>df', 'lua vim.lsp.buf.format()<CR>', { desc = '[D]o [F]ormat' } )
