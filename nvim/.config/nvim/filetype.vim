augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile /tmp/mutt* setfiletype mail
  autocmd Filetype mail let b:coc_enabled = 0
  autocmd Filetype mail setlocal spell spelllang=en_gb textwidth=72
  autocmd Filetype mail setlocal fo+=w
  
  " Git commit message
  autocmd FileType gitcommit set textwidth=72 colorcolumn=72 colorcolumn+=50
  autocmd FileType gitcommit let b:EditorConfig_disable = 1

  " Text, markdown & asciidoc
  autocmd Filetype text setlocal spell spelllang=en_gb
  autocmd BufRead *.md set filetype=markdown
  autocmd FileType markdown setlocal spell spelllang=en_gb
  autocmd FileType asciidoc setlocal spell spelllang=en_gb
  
  " Follow Rust code style rules
  autocmd Filetype rust source ~/.config/nvim/scripts/spacetab.vim
  autocmd Filetype rust set colorcolumn=100

  " Yaml
  autocmd BufRead,BufNewFile *.ybe set filetype=yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal spell spelllang=en_gb

  " No autocomplete in text
  autocmd BufRead,BufNewFile /tmp/mutt* let b:coc_enabled = 0
  autocmd Filetype text let b:coc_enabled = 0
  autocmd Filetype markdown let b:coc_enabled = 0

augroup END
