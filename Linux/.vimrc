" Mike Studer's vimrc file
" Last Updated Oct 2024
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
set t_Co=256

syntax on

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
"colorscheme zephyr
colorscheme mike

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" split settings
set splitbelow splitright
" Remap splits navigation to just CTRL + h or v
nnoremap <C-h> <C-w>s
nnoremap <C-v> <C-w>v

" Nerd Tree
"map <C-n> :NERDTreeToggle <cr>
noremap ,n :NERDTreeToggle <CR>
noremap ,s :SyntasticCheck <CR>
noremap ,w :FixWhitespace <CR>
"

" Lightline
let g:lightline = {
      \ 'colorscheme': 'materia',
      \ }

" ALE
" I doubt this works but I left it in...
let g:ale_python_flake8_args="--ignore=E501"

" LSP section
filetype plugin on
" Turn off document diagnostics so ALE can do it
let g:lsp_diagnostics_enabled = 0
" Copied (almost) directly from the vim-lsp docs:
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

