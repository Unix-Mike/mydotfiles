" Mike Studer's vimrc file

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" ********* Mike's plugins *********
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'ShowMarks'
Plugin 'The-NERD-tree'
Plugin 'surround.vim'
Plugin 'tComment'
Plugin 'Tabular'
Plugin 'EasyMotion'

" ***********************************************************
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ====================================================
set autoindent
set showmode
set showmatch
set mouse=a
set ruler
set showcmd
set autoread
set noswapfile
set history=50
set laststatus=2

" Numbers
set number
set numberwidth=5

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

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

set updatetime=2000

syntax on

"====== Colors ======
" color jellybeans
" color maui
" color Chasing_Logic
"color zephyr
"color rdark-terminal
"color northsky
"color nightsky
" color vj
color vibrantink
" color ubloh

" ====== Key Mappings ======
map <C-n> :NERDTreeToggle <cr>



