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
nnoremap <leader>Ev :split $MYVIMRC <CR> :only<cr>;
nnoremap <leader>sv :source $MYVIMRC <CR>;

" Run
noremap <F7> :wa<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>;

" Rebuild and Run
noremap <F5> :wa<CR> :silent !clear; make OBJ_NAME="vimTest"<CR> :!echo "--------------- Running ---------------"; echo; "./vimTest"<CR>;

" Rebuild
noremap <F4> :wa<CR> :make <bar> copen<CR>;

" Save when losing focus
au FocusLost * :wa<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

noremap H ^
noremap L $
vnoremap L g_

nnoremap gI .

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

nnoremap <leader><ESC> :qa!<CR>;
nnoremap <leader>w  :wa<CR>;

" Variable setting {{{
au FileType vim set foldmethod=marker
set encoding=utf-8
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
filetype on
" }}}

nnoremap <F6> :set invpaste paste? <CR>
set pastetoggle=<F6>
set showmode
map Y y$
nmap <silent> ,/ :nohlsearch<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader><SPACE> :w<CR>

nnoremap <space> za
vnoremap <space> za

" Save and quit files more easily
nnoremap <leader>q ZQ " Quit file without saving
nnoremap <leader>z ZZ " Save and quit file

" Jumping to tags.
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
function! JumpToTag()
    execute "normal! \<c-]>mzzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction
function! JumpToTagInSplit()
    execute "normal! \<c-w>v\<c-]>mzzMzvzz15\<c-e>"
    execute "keepjumps normal! `z"
    Pulse
endfunction

nnoremap <c-]> :silent! call JumpToTag()<cr>:call search_pulse#Pulse()<CR>
nnoremap <c-\> :silent! call JumpToTagInSplit()<cr> search_pulse#Pulse()<CR>

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" Don't move on *
nnoremap * *<C-O>

" Keep search matches in the middle of the window and pulse the window
nnoremap n nzzzv:call search_pulse#Pulse()<CR>
nnoremap N Nzzzv:call search_pulse#Pulse()<CR>

nnoremap g; g;zz:call search_pulse#Pulse()<CR>
nnoremap g, g,zz:call search_pulse#Pulse()<CR>
nnoremap <c-o> <c-o>zz:call search_pulse#Pulse()<CR>

" Return to the same line when reopening files
augroup line_return
    au!
    au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\     execute 'normal! g`"zvzz' |
	\ endif
augroup END

set exrc
set secure
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray
syntax on
set splitbelow
set splitright

" easier movement between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>v <C-w>v

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
  "call setline(3,substitute(getline(1),'.','=','g'))
  execute '$read !'. expanded_cmdline
  execute 'normal! ggdd'
  setlocal nomodifiable
  1
endfunction

nnoremap <leader>ll :Shell pushd ~/.vim > /dev/null && echo "List of installed plugins" && echo "=========================" && git submodule \| sed 's/.*bundle\///' \| awk '{print $1}' && popd > /dev/null<CR> :only<CR>

" Unite.vim mappings

"   Enable Yank history
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :Unite history/yank<CR>

"   File finding mappings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t  :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

nnoremap <leader>Ft :Unite file_rec/async -start-insert -default-action=tabopen<CR>
nnoremap <leader>Fs :Unite file_rec/async -start-insert -default-action=split<CR>
nnoremap <leader>Fv :Unite file_rec/async -start-insert -default-action=vsplit<CR>

"   Buffer switching
nnoremap <leader>ss :Unite -quick-match buffer<cr>

let g:airline_powerline_fonts=1
execute "silent! normal! :AirlineTheme solarized<CR>"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
