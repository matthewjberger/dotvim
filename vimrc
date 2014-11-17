set nocompatible
filetype off

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

inoremap jk <ESC>;
nnoremap<F8> :TagbarToggle<CR> 
set number
let mapleader = ","
nnoremap <leader>ev :split $MYVIMRC <CR>;
nnoremap <leader>sv :source $MYVIMRC <CR>;
noremap <F5> :wa<CR> :silent !clear; make OBJ_NAME="vimTest"<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>; 
noremap <F4> :wa<CR> :make <bar> copen<CR>; 
nnoremap <leader><ESC> :qa!<CR>;
nnoremap <leader>w  :wa<CR>;
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
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set softtabstop=4
set expandtab
nnoremap <F2> :set invpaste paste? <CR>
set pastetoggle=<F2>
set showmode
map Y y$
nmap <silent> ,/ :nohlsearch<CR>
filetype on
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <SPACE> :
nnoremap <leader><SPACE> :w<CR>

" Save and quit files more easily
nnoremap <leader>q ZZ       " Quit file without saving

" Navigate using tags
map <C-\> :tab split<cr> :exec("tag ".expand("<cword>"))<CR>
map <A-]> :split <CR> :exec("tag ".expand("<cword>"))<CR>

set exrc
set secure
set t_Co=256
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
syntax on
set splitbelow
set splitright
set background=dark

" easier movement between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use ack for searching
set grepprg=ack

" FSwitch mappings

 " Switch to the file and load it into the current window 
	nmap <silent> <Leader>of :FSHere<cr>

 " Switch to the file and load it into the window on the right 
	nmap <silent> <Leader>ol :FSRight<cr>

 " Switch to the file and load it into a new window split on the right 
	nmap <silent> <Leader>oL :FSSplitRight<cr>

 " Switch to the file and load it into the window on the left 
	nmap <silent> <Leader>oh :FSLeft<cr>

 " Switch to the file and load it into a new window split on the left 
	nmap <silent> <Leader>oH :FSSplitLeft<cr>

 " Switch to the file and load it into the window above 
	nmap <silent> <Leader>ok :FSAbove<cr>

 " Switch to the file and load it into a new window split above 
	nmap <silent> <Leader>oK :FSSplitAbove<cr>

 " Switch to the file and load it into the window below 
	nmap <silent> <Leader>oj :FSBelow<cr>

 " Switch to the file and load it into a new window split below 
	nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Add ability to rename file while editing that file
function! RenameFile()
    let old_name = expand(%)
    let new_name = input('New file name: ', expand(%), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas' . new_name
        exec 'silenet !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<CR>

colorscheme solarized
