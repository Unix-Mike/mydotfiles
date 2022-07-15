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
set statusline+=%#warningmsg#
set statusline+=%*

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
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
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
"colorscheme 256-jungle
"colorscheme vc
colorscheme DevC++
"colorscheme twitchy

" split settings
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nerd Tree
noremap ,n :NERDTreeToggle <CR>
noremap ,w :FixWhitespace <CR>
"

" vim Macros
"   Remove double quotes from entire file
let @q=':%s/"//g'
"   Remove all comment lines beginning with a #
let @c=':g/^#.*/d'

" Put these lines at the very end of your vimrc file
"    Load all plugins now
"    Plugins need to be added to runtimepath before helptags can be generated
packloadall
"    Load all of the helptags now that plugins have been loaded
" All messages and errors will be ignored
silent! helptags ALL



