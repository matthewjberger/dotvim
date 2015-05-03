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

" easier movement between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

set t_Co=16
colorscheme solarized
set background=dark

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

" Sets arduino filetypes
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <leader>rtw :call TrimWhiteSpace()<CR>

autocmd FileWritePre   * :call TrimWhiteSpace()
autocmd FileAppendPre  * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre    * :call TrimWhiteSpace()

" Toggle solarized light/dark
call togglebg#map("<F10>")

" Python configuration
augroup vimrc_autocmds
    autocmd!
    "highlight characters past col 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd Filetype python match Excess /\%120v.*/
    autocmd Filetype python set nowrap
augroup END

" zM to open all folds
" zR to close all folds
autocmd Syntax c,cpp,h setlocal foldmethod=syntax
autocmd Syntax c,cpp,h normal zR

"You Complete Me syntax config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Enable search pulse
set cursorline

" Run shell commands
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(1, 'List of installed plugins:')
  call setline(2,substitute(getline(1),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

nnoremap <leader>ll :Shell pushd ~/.vim && git submodule \| sed 's/.*bundle\///' \| awk '{print $1}' && popd<CR>
