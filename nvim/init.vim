call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sjl/badwolf'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()

set number
set smartcase
set ignorecase
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline 

syntax enable
colorscheme monokai

" Key maps

map <C-n> :NERDTreeToggle<CR>
map <C-t> :Files<CR>

