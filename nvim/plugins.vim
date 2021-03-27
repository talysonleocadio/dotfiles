scriptencoding utf-8

" Fzf_vim
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-messages --glob="!{**/*.min.js,**/*.min.css,.git/*}"'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}

" Ale
let g:ale_linters_explicit = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'python': ['autoimport']
\}
let g:ale_linters = {
  \ 'javascript': ['eslint', 'tsserver'],
  \ 'python': ['flake8'],
  \ 'php': ['langserver', 'phpmd'],
  \ 'vim': ['vint'],
  \ 'typescript': ['eslint', 'tsserver']
\}

let g:ale_php_langserver_executable = $HOME.'/.config/composer/vendor/bin/php-language-server.php'
let g:ale_php_phpmd_executable = $HOME.'/.config/composer/vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset = 'cleancode,codesize,unusedcode'

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
let g:EditorConfig_verbose = 1

" vim-startify
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [{'n': '~/.dotfiles/nvim/init.vim'}, {'z':'~/.dotfiles/zsh/.zshrc'}, {'i': '~/.dotfiles/i3/config'}]

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

" identLine
let g:indentLine_char = '▏'
let g:indentLine_color_term = 239

" Gitgutter settings
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_grep='rg'

highlight GitGutterAdd    guifg=#009900 guibg=#3c3836
highlight GitGutterChange guifg=#bbbb00 guibg=#3c3836
highlight GitGutterDelete guifg=#ff2222 guibg=#3c3836


" Shortcuts definitions
runtime plugin/shortcut.vim

Shortcut 'Show shortcut menu and run chosen shortcut'
      \ noremap <silent> <Space><Space> :Shortcuts<CR>
Shortcut 'Fallback to shortcut menu on partial entry'
      \ noremap <silent> <Space> :Shortcuts<CR>
Shortcut 'Fzf: open file search and go to chosen file'
      \ map <silent> <Space>ff :Files<CR>
Shortcut 'Fzf: open gfiles search and go to chosen file'
      \ map <silent> <Space>fg :GFiles<CR>
Shortcut 'Fzf: open buffers search and go to choses buffer'
      \ map <silent> <Space>sb :Buffers<CR>
Shortcut 'Vim-plug: install new plugins'
      \ noremap <silent> <Space>pi :PlugInstall<CR>
Shortcut 'Vim-plug: remove unsable plugins'
      \ noremap <silent> <Space>pc :PlugClean<CR>
Shortcut 'Vim-plug: update all plugins plugins'
      \ noremap <silent> <Space>pu :PlugUpdate<CR>
Shortcut 'NERDTree: toggle navigation tree'
      \ noremap <silent> <Space>nt :NERDTreeToggle<CR>
Shortcut 'Startify: go back to main menu'
      \ noremap <silent> <Space>bs :Startify<CR>
Shortcut 'Clear highlight search'
      \ noremap <silent> <C-l> :noh<CR>
Shortcut 'Vim-mundo: Toggle undo tree'
      \ noremap <silent> <Space>mt :MundoToggle<CR>
Shortcut 'Tagbar: Toggle tagbar'
      \ noremap <silent> <Space>tt :TagbarToggle<CR>
Shortcut 'Ale: Go to next issue'
      \ nmap <silent> <C-k> <Plug>(ale_previous_wrap)
Shortcut 'Ale: Go to previous issue'
      \ nmap <silent> <C-j> <Plug>(ale_next_wrap)
Shortcut 'Source the current file'
      \ noremap <silent> <Space>sf :source %<CR> :echo "The file have been sourced"<CR>
Shortcut 'Fugitive: Akin to git status'
      \ noremap <silent> <Space>gs :G<CR>
Shortcut 'Format code'
      \ noremap <silent> <Space>af :Autoformat<CR>
Shortcut! <C-]> 'Go to tag definition'
Shortcut! <C-t> 'Jumpback from tag definition'
Shortcut! <C-w>v 'Vertical split screen'
Shortcut! <C-w>s 'Horizontal split screen'

" Gutentags options
let g:gutentags_ctags_tagfile = '.git/tags'
let g:gutentags_file_list_command = "rg --files --no-messages --glob='!{**/*.min.*,.git/*,**/*.html, **/*.map.*}'"

" Emmet options
let g:user_emmet_leader_key=','

" vim-markdown options
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" nvim_typescript
let g:nvim_typescript#diagnostics_enable = 0

" vim-autoformat
let g:formatdef_tidy_only_body_formatter = '"tidy -q -mi --show-errors 0 --show-warnings 0 --show-body-only yes -wrap 0"' " Install tidy via package manager
let g:formatters_html = ['tidy_only_body_formatter']

" Gruvbox
let g:gruvbox_italic = 1
