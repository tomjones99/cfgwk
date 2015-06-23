syntax enable
colorscheme Tomorrow-Night-Bright
set background=dark

set number

" set tabs to 4 spaces and expand
set tabstop=4
set shiftwidth=4
set expandtab

" strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

let $PYTHONPATH="/usr/lib/python3.3/site-packages"
