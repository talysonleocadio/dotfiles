call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'quramy/tsuquyomi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ryanoasis/vim-devicons'
Plug 'kovisoft/slimv'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'Yggdroot/indentLine'
Plug 'integralist/vim-mypy'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

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
set smartindent
set termguicolors
set updatetime=100

syntax enable
let g:gruvbox_italic=1
colorscheme gruvbox

" Autocommands
autocmd BufWrite * %s/\s\+$//e

" Key maps
let mapleader = "\<Space>"
map <silent> <leader>nt :NERDTreeToggle<CR>
map <silent> <leader>sb :Buffers<CR>
map <silent> <leader>bs :Startify<CR>
map <silent> <leader>pi :PlugInstall<CR>
map <silent> <leader>pc :PlugClean<CR>
map <silent> <leader>d :noh<CR>
map <C-t> :Files<CR>

" Fzf_vim
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --no-messages --glob="!{**/*.min.js,**/*.min.css,.git/*}"'

" Ale
let g:ale_linters_explicit = 1
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ 'php': ['langserver', 'phpmd'],
  \ 'vim': ['vint'],
  \ 'typescript': ['tslint']
\}

let g:ale_php_langserver_executable = $HOME.'/.config/composer/vendor/bin/php-language-server.php'
let g:ale_php_phpmd_executable = $HOME.'/.config/composer/vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset = 'cleancode,codesize,unusedcode'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" lightline
let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'filetype', 'fileformat' ],
  \              [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' ],
  \ ]
  \
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'filetype': 'CustomFileType',
  \   'fileformat': 'CustomFileFormat'
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

 function! CustomFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol(): 'no ft') : ''
 endfunction

 function! CustomFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
 endfunction

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

" identLine
let g:indentLine_char = '▏'
let g:indentLine_color_term = 239

" Vim-MultipleCursors settings
let g:multi_cursor_select_all_word_key = '<leader>na'


" Gitgutter settings
let g:gitgutter_sign_added = '\ +'
let g:gitgutter_sign_modified = '\ ~'
let g:gitgutter_sign_removed = '\ _'
let g:gitgutter_grep='rg'

highlight GitGutterAdd    guifg=#009900
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222
