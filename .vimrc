set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'tomasr/molokai'

Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Airline plugin settings
" -------------------------------------

" To see powerline status bar always
set laststatus=2

:let g:airline_theme='badwolf'

" NERDTree plugin settings
" -------------------------------------

autocmd vimenter * NERDTree

let NERDTreeShowBookmarks=1

" Vim goblal settings
" -------------------------------------

set number
set encoding=utf-8
set clipboard=unnamed

colorscheme molokai

" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=119
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Front-end Indentation
"au BufNewFile,BufRead *.js
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

" Flagging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.js match BadWhitespace /\s\+$/





