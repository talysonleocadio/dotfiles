call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'valloric/youcompleteme', {'do': './install.py --tern-completer'}
Plug 'quramy/tsuquyomi'
Plug 'tpope/vim-commentary'
Plug 'stanangeloff/php.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

call plug#end()

set number relativenumber
set smartcase
set ignorecase
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline 
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:•
set list
set completeopt-=preview

syntax enable
colorscheme badwolf 

" Key maps
map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
noremap <esc> :noh<CR>
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Fzf_vim 
let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --glob="!{**/*.min.js,**/*.min.css,.git/*}"'

" youcompleteme
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Ale
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}

" lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
