set nocompatible
filetype off

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

inoremap jk <ESC>;
set number
let mapleader = ","
nnoremap <leader>ev :split $MYVIMRC <CR>;
nnoremap <leader>sv :source $MYVIMRC <CR>;
noremap <F5> :wa<CR> :silent !clear; make OBJ_NAME="vimTest"<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>; 
noremap <F4> :wa<CR> make<CR>; 
set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
autocmd filetype python set expandtab
set wildmenu
set showcmd
set si
set nostartofline
set ruler
set laststatus=2
set confirm
set t_vb=
set cmdheight=2
set mouse=a
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set expandtab
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
filetype on
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <SPACE> :
nnoremap <leader><SPACE> :w<CR>
nnoremap <leader>q ZQ
nnoremap <leader>z ZZ
map <C-\> :tab split<cr> :exec("tag ".expand("<cword>"))<CR>
map <A-]> :split <CR> :exec("tag ".expand("<cword>"))<CR>
set exrc
set secure
set t_Co=256
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
syntax on
set background=dark
colorscheme solarized
