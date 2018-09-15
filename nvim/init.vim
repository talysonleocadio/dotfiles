call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

set number
set smartcase
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline 

colorscheme molokai
