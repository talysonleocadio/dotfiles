scriptencoding utf-8
call plug#begin('~/.local/share/nvim/plugged')

" Code
Plug 'mhartington/nvim-typescript', {'do': './install.sh', 'for': ['typescript', 'javascript']} " Typescript support
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'} " Python
Plug 'Shougo/neco-vim', {'for': 'vim'} " Vim linter
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} " Completion framework
Plug 'editorconfig/editorconfig-vim' " Editorconfig for (neo)vim
Plug 'Galooshi/vim-import-js', {'for': 'javascript'}
Plug 'Chiel92/vim-autoformat' " Code formatting

" Writing
Plug 'dbmrq/vim-ditto'
Plug 'reedes/vim-pencil'

" Misc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'} " Undo tree visualization
Plug 'RRethy/vim-illuminate'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'} " See all tags of the current file
Plug 'sunaku/vim-shortcut'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " File explorer
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim', {'for': 'html'}

" Syntax helpers
Plug 'sheerun/vim-polyglot'

" Linters
Plug 'dense-analysis/ale'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

" Global configurations
source ~/.config/nvim/base.vim
" Shorcut mappings
source ~/.config/nvim/mappings.vim
" Plugins' configurations
source ~/.config/nvim/plugins.vim
