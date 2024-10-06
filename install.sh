#!/bin/bash  -i
set -x
sudo mount -o remount,rw /
sudo apt update
sudo apt install -y build-essential git cmake vim-nox python3-dev exuberant-ctags fzf ripgrep devscripts meson htop tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.config/nvim
cat <<EOF > ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
EOF

cat <<EOF > ~/.vimrc
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
EOF

vim -c :PluginInstall -c :qa
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

#git config --global user.name ""
#git config --global user.email ""
#git config --global core.editor vim

sed -i 's/let s:comment_grey = s:colors.comment_grey/let s:comment_grey = s:colors.yellow/g' ~/.vim/bundle/onedark.vim/colors/onedark.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat <<EOF > ~/.tmux.conf
set -g default-terminal "screen-256color"

# vim mode switch time
set -sg escape-time 0

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# switch panes using Alt-arrow without prefix
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

# Enable mouse mode (tmux 2.1 and above)
set-option -g mouse on

# statusbar
set -g status-position bottom
set -g status-justify left
set -g status-bg colour2
set -g status-fg colour137
set -g status-attr dim
set -g status-left ''
set -g status-right '#[fg=colour233,bg=colour2,bold] %d/%m #[fg=colour233,bg=colour4,bold] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-style fg=colour1,bg=colour2,bold
setw -g window-status-current-format ' #I#[fg=colour249]:#[fg=colour255]#W#[fg=colour249]#F '

setw -g window-status-style fg=colour9,bg=colour2,none
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

setw -g window-status-bell-style fg=colour255,bg=colour1,bold

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-sidebar'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
EOF
