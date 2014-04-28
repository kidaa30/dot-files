" theme
colorscheme solarized
let g:solarized_termcolors=256
set background=dark

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'rking/ag.vim'

filetype plugin indent on

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
