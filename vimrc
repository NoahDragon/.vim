" Set compatibility to Vim only
set nocompatible

if has("win32") " including 64bits
	call plug#begin('~/vimfiles/plugged')
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	call plug#begin('~/.vim/plugged')
endif

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'

call plug#end()
"
" Plugin Configurations
"
colorscheme gruvbox
set background=dark
" Inverrts cursor color for gruvbox
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

map <F8> :NERDTreeToggle<CR>

map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
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
au GUIEnter * simalt ~x " Maximize gVIM on startup

" Set status line display
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
"set statusline=%F%m%r%h%w\ [F=%{&ff}]\ [T=%Y]\ [P=%l,%v][%p%%]\ [B=%n]\ %{strftime('%c')}

" Map the <SPC> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Navigating between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Change leader key to space
" nnoremap <Space> <Nop>
let mapleader=","

set tabstop=4
set shiftwidth=4
set autoindent

" Fix backspace
set bs=2

" autocmd BufWritePost $MYVIMRC source $MYVIMRC " Auto apply new change when save, but really slow on windows.

