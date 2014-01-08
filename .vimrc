set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set textwidth=80
set pastetoggle=<F2>

set number
syntax on
filetype indent on

map <C-K> :pyf ~/.vim/python/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/.vim/python/clang-format.py<CR>i
nmap <silent> <F5> :call ClangCheck()<CR><CR>

if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

endif
