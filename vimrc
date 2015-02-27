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

" Run
noremap <F7> :wa<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>;

" Rebuild and Run
noremap <F5> :wa<CR> :silent !clear; make OBJ_NAME="vimTest"<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>; 

" Rebuild
noremap <F4> :wa<CR> :make <bar> copen<CR>; 

nnoremap <leader><ESC> :qa!<CR>;
nnoremap <leader>w  :wa<CR>;
set hidden
set nowrap
set tabstop=4
set backspace=indent,eol,start
set smartindent
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
nnoremap <F6> :set invpaste paste? <CR>
set pastetoggle=<F6>
set showmode
map Y y$
nmap <silent> ,/ :nohlsearch<CR>
filetype on
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <SPACE> :
nnoremap <leader><SPACE> :w<CR>

" Save and quit files more easily
nnoremap <leader>q ZQ " Quit file without saving
nnoremap <leader>z ZZ " Save and quit file 

" Navigate using tags
map <C-\> :tab split<cr> :exec("tag ".expand("<cword>"))<CR>
map <A-]> :split <CR> :exec("tag ".expand("<cword>"))<CR>

set exrc
set secure
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

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

" Add node linting to file
function! EnableNodeLint()
    exec ':normal 0ggi/*jslint node:true*/'
endfunction

" Map node linting enabler
nnoremap <leader>ln :call EnableNodeLint()<CR>

"Automatic node linting during js file creation
autocmd BufNewFile *.js :call EnableNodeLint()

set t_Co=16
colorscheme solarized

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

