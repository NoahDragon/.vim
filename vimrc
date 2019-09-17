" Set compatibility to Vim only
set nocompatible

if has("win32") " including 64bits
	call plug#begin('~/vimfiles/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

Plug 'morhetz/gruvbox'

call plug#end()
"
" Plugin Configurations
"
colorscheme gruvbox
set background=dark
"
" End Plugin Configurations
"
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

" Turn on syntax highlighting
syntax on 

set number
set cursorline
set showmatch
set paste
set wrap
" GVIM settings
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar
set guioptions-=L " remove left-hand scroll bar

" Set status line display
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
set statusline=%F%m%r%h%w\ [F=%{&ff}]\ [T=%Y]\ [P=%l,%v][%p%%]\ [B=%n]\ %{strftime('%c')}

" Map the <SPC> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Navigating between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set tabstop=4
set shiftwidth=4
set autoindent

" Fix backspace
set bs=2

" autocmd BufWritePost $MYVIMRC source $MYVIMRC " Auto apply new change when save, but really slow on windows.

