" Set compatibility to Vim only
set nocompatible
set exrc
set secure

if has("win32") " including 64bits
	call plug#begin('~/vimfiles/plugged')
	"  Manually installed Plugins
    Plug '~/vimfiles/plugged/YouCompleteMe'
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	call plug#begin('~/.vim/plugged')
    Plug '~/.vim/plugged/YouCompleteMe'
endif

" Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as':'dracula'}
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-grepper'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
" Plug 'scrooloose/nerdcommenter'

call plug#end()
"
" Plugin Configurations
"
colorscheme dracula
" colorscheme gruvbox
" set background=dark
"
" " Inverrts cursor color for gruvbox
" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
"
" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" vim-airline
let g:airline#extensions#tabline#enabled=1

let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlPBuffer'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_root_markers=['Makefile', 'p4config']

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

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']
"
" End Plugin Configurations
"
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

" Turn on syntax highlighting
syntax on 
autocmd BufEnter * :syntax sync fromstart

set number
set cursorline
set showmatch
set paste
set wrap
set hidden
set confirm
set ignorecase
set autochdir
" GVIM settings
if has("gui_running")
	set guioptions-=m " remove menu bar
	set guioptions-=T " remove toolbar
	set guioptions-=r " remove right-hand scroll bar
	set guioptions-=L " remove left-hand scroll bar
	set guifont=Consolas:h12 " fix italics letter crop issue
	au GUIEnter * simalt ~x " Maximize gVIM on startup
endif

" Set status line display
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
"set statusline=%F%m%r%h%w\ [F=%{&ff}]\ [T=%Y]\ [P=%l,%v][%p%%]\ [B=%n]\ %{strftime('%c')}

" CTags
set tags=tags;/

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

