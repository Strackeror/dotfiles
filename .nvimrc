call plug#begin('~/.nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'oblitum/YouCompleteMe'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'LeBarbu/vim-epitech'

call plug#end()

filetype plugin on
filetype indent on

set autoread

let mapleader = ";"

set ruler
set ignorecase
set smartcase

set incsearch

set lazyredraw

set magic

set showmatch

set mat=2

syntax enable
set encoding=utf8
set ffs=unix

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

set smarttab
set shiftwidth=2
set tabstop=8

set ai
set si
set wrap

set number

" Activate vim-airline at start
set laststatus=2

set clipboard=unnamedplus

set list lcs=trail:·,tab:\ \ 
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
		
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"nnoremap <A-h> gT
"nnoremap <A-l> gt
nnoremap <A-h> :bprev!<cr>
nnoremap <A-l> :bnext!<cr>
inoremap <S-Tab> <C-v><Tab>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" clears search highlights
map <leader><cr> :noh<cr>

noremap <Up> <Nop>
noremap <Down> <Nop>
nnoremap <Left> <<
nnoremap <Right> >>
inoremap <Left> <C-d>
inoremap <Right> <C-t>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember file position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
set viminfo^=%

set t_Co=256
let base16colorspace=256
colorscheme base16-default
set background=dark

let g:ycm_global_ycm_extra_conf = '~/.config/ycm/ycm_global_conf.py'
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview

let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_cmd = 'CtrlP'
