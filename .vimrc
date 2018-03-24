set viminfo+=n.viminfo

autocmd BufRead,BufNewFile *.md setlocal nospell
autocmd BufRead,BufNewFile *.* setlocal expandtab tabstop=2 shiftwidth=2
