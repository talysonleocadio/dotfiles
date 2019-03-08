call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'quramy/tsuquyomi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins'} " See the README.md on source project for more details
Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

set number relativenumber
set smartcase
set ignorecase
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline
set completeopt-=preview
set autoindent
set ts=2 sw=2

syntax enable
colorscheme badwolf

" Autocommands
autocmd BufWrite * %s/\s\+$//e

" Key maps
map <C-n> :NERDTreeToggle<CR>
map <C-t> :Files<CR>
noremap <esc> :noh<CR>

" Fzf_vim
let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --glob="!{**/*.min.js,**/*.min.css,.git/*}"'

" Ale
let g:ale_linters_explicit = 1
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'php': [ 'phpcs', 'langserver'],
  \ 'vim': ['vint']
\}

let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = $HOME.'/.config/composer/vendor/bin/php-language-server.php'
let g:ale_php_phpcs_use_global = 1
let g:ale_php_phpcs_executable = $HOME.'/.config/composer/vendor/bin/phpcs'

" lightline
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileenconding', 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \ }
  \ }

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Xclip copy/paste
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" vim-startify
let g:startify_bookmarks = [{'d': '~/.dotfiles/nvim/init.vim'}, {'z':'~/.dotfiles/zsh/.zshrc'}]

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" Vim indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
hi IndentGuidesOdd  ctermbg=237
hi IndentGuidesEven ctermbg=238
