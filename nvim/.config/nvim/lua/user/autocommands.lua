vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufRead *.orig set readonly
    autocmd BufRead *.pacnew set readonly
    autocmd InsertLeave * set nopaste
    au BufReadPost * if expand('%:p') !~# '\m/\.git' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal textwidth=72 colorcolumn=72 colorcolumn+=50
    autocmd FileType gitcommit setlocal wrap
  augroup end

  augroup _markdown
    autocmd!
    autocmd BufRead *.md set filetype=markdown
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell spelllang=en_gb
  augroup end

  augroup _mail
    autocmd BufRead,BufNewFile /tmp/mutt* setfiletype mail
    autocmd FileType mail lua require('cmp').setup.buffer { enabled = false }
    autocmd FileType mail setlocal spell spelllang=en_gb textwidth=72
    autocmd FileType mail setlocal fo+=w
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _asciidoctor
    autocmd!
    autocmd BufRead *.adoc set filetype=asciidoc
    autocmd FileType asciidoc setlocal spell spelllang=en_gb
]]

