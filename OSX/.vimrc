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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
   \ "mode": "passive"}


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

" Lightline config

\let g:lightline = {
      \ 'colorscheme': 'materia',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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
color mike


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

" vim Macros
"   Remove double quotes from entire file
let @q=':%s/"//g'
"   Remove all comment lines beginning with a #
let @c=':g/^#.*/d'

