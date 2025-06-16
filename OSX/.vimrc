" Mike Studer's vimrc file
"
set nocompatible        " be iMproved, required
filetype off            " required
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set mouse=a             " Enable mouse usage (all modes)
set ruler
set autoread
set noswapfile
set laststatus=2
set history=50
set autoindent
set showmode
set path+=**
set wildmenu

syntax on
" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"    \ "mode": "passive"}

" Numbers
set number
set numberwidth=5

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indents
set tabstop=4
set shiftwidth=4
set expandtab

" ALE config settings
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_fixers = {
\   'python': ['black'],
\}
" I am specifying my linter so I know who is to blame for error msg
let g:ale_linters = {
\   'python': ['flake8'],
\}

" Lightline config
let g:lightline = {}
" \ 'colorscheme': 'simpleblack'
" \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'FugitiveHead'
      \ }

let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \              [ 'lineinfo' ],
	  \              [ 'percent' ],
	  \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ }


" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

" let g:lightline.active = {
"             \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
"             \            [ 'lineinfo' ],
" 	    \            [ 'percent' ],
" 	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }


set rnu
function! ToggleNumbersOn()
        set nu!
        set rnu
endfunction

function! ToggleRelativeOn()
        set rnu!
        set nu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleNumbersOn()

highlight ShowMarksHLl ctermfg=white ctermbg=blue
highlight ShowMarksHLu ctermfg=white ctermbg=blue
highlight ShowMarksHLo ctermfg=white ctermbg=blue
highlight ShowMarksHLm ctermfg=white ctermbg=blue

" Colors
"color jellybeans
"color maui
"color Chasing_Logic
"color zephyr
"color rdark-terminal
"color northsky
"color vibrantink
"color vj
"color vc
"color zephyr
colorscheme mike

" split settings
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nerd Tree
"map <C-n> :NERDTreeToggle <cr>
noremap ,n :NERDTreeToggle <CR>
noremap ,s :SyntasticCheck <CR>
noremap ,w :FixWhitespace <CR>
"
" LSP section
filetype plugin on
" Turn off document diagnostics so ALE can do it
let g:lsp_diagnostics_enabled = 0

" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
    " is registered for a buffer.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

