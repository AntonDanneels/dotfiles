set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Absolute basics
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'

" Linting and spellcheck
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lyuts/vim-rtags'

" color themes
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/seoul256.vim'

" IDE-like extensions
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'mesonbuild/meson'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

set rtp+=~/.fzf
let g:fzf_launcher = 'xterm -e bash -ic %s'

syntax on
syntax enable
set number
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set hlsearch
set incsearch
colorscheme onedark

set laststatus=2
set t_Co=256
set noshowmode

noremap <c-j> 7jzz
noremap <c-k> 7kzz

noremap <C-c> "+y
noremap <C-v> "+p

noremap <C-s> :mksession! session.vim<CR>
noremap <C-r> :source session.vim<CR>

nnoremap <s-J> <C-W><C-J>
nnoremap <s-K> <C-W><C-K>
nnoremap <s-L> <C-W><C-L>
nnoremap <s-H> <C-W><C-H>

nnoremap <C-f> g]

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF!<CR>

nnoremap <F1> :noh<CR>
nnoremap <F2> :ALEDetail<CR>
nnoremap <F3> :q<CR>

nnoremap <C-Bslash> :vsp<CR>

nmap <F8> :bnext<CR>
nmap <F9> :bprevious<CR>
nmap <F7> :ls<CR>
nnoremap <C-l> :TagbarToggle<CR>

let mapleader=" "
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

tnoremap <Esc> <C-\><C-n> " Close :terminal with Escape

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
let g:airline#extensions#tabline#enabled = 1
let g:rtagsRcCmd = '/home/anton/Documents/rtags/bin/rc'

let g:ale_echo_cursor = 0

let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline_skip_empty_sections = 1

set mouse=a
