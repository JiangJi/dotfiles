" **********************
"" vimrc
"" demote
"" 2011.4.4
" **********************

"Set mapleader
let mapleader = ","
let g:mapleader = ","
"Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" A buffer becomes hidden when it is abandoned
set hid

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Height of the command bar
set cmdheight=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" --- Buffer ---
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Specify the behavior when switching between buffers 

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" --- 20170809 ---
" behavior
set modelines=0
set encoding=utf-8
set scrolloff=3
set hidden
" set relativenumber
set undofile
set backupdir=~/.vim/backup//,/tmp
set directory=~/.vim/swap//,/tmp
set undodir=~/.vim/undo//,/tmp
" search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" wrap
set wrap
set formatoptions=qrn1
set colorcolumn=100
set list
set list listchars=tab:»\ ,trail:°
" random
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
nnoremap ; :
nnoremap <s-k> <CR>


"when auto-complete, list all possible options
set wildmenu
set wildmode=longest:full

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]

set nobackup
set history=50
set showcmd
set incsearch
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set softtabstop=2
set expandtab
set linebreak
set hlsearch
set autochdir

"fold method
set foldmethod=syntax
set foldlevel=100       " Don't autofold anything (but I can still fold manually

" Don't use Ex mode, use Q for formatting
map Q gq


syn on
filetype plugin indent on

" set cindent
" set autoindent
" set smartindent
" set ai!


"auto-shift width
set shiftwidth=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" status line
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set laststatus=2
set ruler


" map key
"F2--> no highlight search F3-->move cursor to another window
":inoremap <C-L> <ESC>la
":imap <C-H> <ESC>ha
":imap <C-J> <ESC>ja
":imap <C-K> <ESC>ka
":nmap <F5> :tabprevious<cr>
":nmap <F6> :tabnext<cr>
:nmap <F3> :nohls<cr>
inoremap <ALT-h> <Left>
inoremap <ALT-j> <Down>
inoremap <ALT-k> <Up>
inoremap <ALT-l> <Right>
:nmap <F6> :set paste<CR>"*p:set nopaste<CR>
:nmap <F5> :set paste<CR>"+p:set nopaste<CR>
" using system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamed
endif
noremap <Leader>W :w !sudo tee % > /dev/null
" vimgdb
":set previewheight=1" set gdb window initial height
":run macros/gdb_mappings.vim" source key mappings listed in this document
":set asm=0" don't show any assembly stuff
":set gdbprg=/usr/bin/gdb

set t_Co=256


" --- color scheme start ---
set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
  syntax reset
    endif
endif

highlight Normal guifg=white guibg=grey20 ctermfg=231 ctermbg=236
highlight Cursor guifg=slategrey guibg=khaki ctermfg=67 ctermbg=186
highlight VertSplit guifg=grey50 guibg=#c2bfa5 gui=NONE ctermfg=244 ctermbg=144 cterm=NONE
highlight Folded guifg=gold guibg=grey30 ctermfg=220 ctermbg=239
highlight FoldColumn guifg=tan guibg=grey30 ctermfg=180 ctermbg=239
highlight IncSearch guifg=slategrey guibg=khaki ctermfg=67 ctermbg=186
highlight ModeMsg guifg=goldenrod ctermfg=178
highlight MoreMsg guifg=seagreen ctermfg=29
highlight NonText guifg=lightblue guibg=grey30 ctermfg=152 ctermbg=239
highlight Question guifg=springgreen ctermfg=48
highlight Search guifg=wheat guibg=peru ctermfg=223 ctermbg=172
highlight SpecialKey guifg=yellowgreen ctermfg=112
highlight StatusLine guifg=black guibg=#c2bfa5 gui=NONE ctermfg=16 ctermbg=144 cterm=NONE
highlight StatusLineNC guifg=grey50 guibg=#c2bfa5 gui=NONE ctermfg=244 ctermbg=144 cterm=NONE
highlight Title guifg=indianred ctermfg=167
highlight Visual guifg=khaki guibg=olivedrab gui=NONE ctermfg=186 ctermbg=64 cterm=NONE
highlight WarningMsg guifg=salmon ctermfg=210
highlight Comment guifg=skyblue ctermfg=117
highlight Constant guifg=#ffa0a0 ctermfg=217
highlight Identifier guifg=palegreen ctermfg=120
highlight Statement guifg=khaki ctermfg=186
highlight PreProc guifg=indianred ctermfg=167
highlight Type guifg=darkkhaki ctermfg=143
highlight Special guifg=navajowhite ctermfg=223
highlight Ignore guifg=grey40 ctermfg=241
highlight Todo guifg=orangered guibg=yellow2 ctermfg=202 ctermbg=226

highlight Normal guifg=#cccccc guibg=#3f3f3f ctermfg=252 ctermbg=237
highlight Comment guifg=#7f7f7f ctermfg=244
highlight LineNr guifg=#7f7f7f guibg=#464646 ctermfg=244 ctermbg=238

highlight Pmenu guifg=#c0c0c0 guibg=#404080 ctermfg=250 ctermbg=60
highlight PmenuSel guifg=#c0c0c0 guibg=#2050d0 ctermfg=250 ctermbg=26
highlight PmenuSbar guifg=blue guibg=darkgray ctermfg=21 ctermbg=248
highlight PmenuThumb guifg=#c0c0c0 ctermfg=250
" --- color scheme end ---

set nocompatible
set backspace=indent,eol,start

set cursorline
hi CursorLine  cterm=bold


" *****************
" * end of vimrc  *
" *****************
