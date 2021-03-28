scriptencoding utf-8

filetype plugin on
set number relativenumber
set ignorecase
set smartcase
set expandtab
set tabstop=2
set shiftwidth=2
set cursorline
set completeopt-=preview
set autoindent
set smartindent
set termguicolors
set updatetime=300
set inccommand=nosplit
set title

" Default python binary
let g:python3_host_prog = '/usr/bin/python3'

" Undo tree
set undofile
set undodir=~/.nvim/undo

syntax enable
colorscheme gruvbox

" Autocommands
augroup CleaningTrailingSpaces
  autocmd!
  autocmd BufWrite * %s/\s\+$//e
augroup END

augroup Writter
  autocmd!
  autocmd FileType markdown,text call pencil#init({'wrap': 'soft'})
                            \ | DittoOn
augroup END

augroup TerminalInitialization
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber | :startinsert
augroup END

