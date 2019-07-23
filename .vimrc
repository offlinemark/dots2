source ~/.vimrc.local

"vimplug setup
call plug#begin('~/.vim/myplugins')

" Vim plugins
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

"Bundle 'scrooloose/syntastic'
"Bundle 'tpope/vim-dispatch'
"Bundle 'tomtom/tlib_vim'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'
"Bundle 'majutsushi/tagbar'
"Bundle 'dag/vim-fish'
"Bundle 'kien/ctrlp.vim'
"Bundle 'rust-lang/rust.vim'
"Bundle 'rking/ag.vim'

call plug#end()

""""""""""""""""""""

let mapleader = "\<Space>"
" General
filetype off
filetype plugin indent on
syntax enable
set shell=/bin/bash     " required when using fish
set nocompatible
set number
set splitbelow
set splitright
set ruler
set foldmethod=indent
set foldlevel=99
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=7 " light grey color column
set scrolloff=9999      " cursor always in middle
set noswapfile
set tabstop=4 shiftwidth=4 softtabstop=4 autoindent expandtab
set hlsearch incsearch ignorecase smartcase
set mouse=a
set tags=tags;/
set cursorline
" set textwidth=80
set laststatus=2
set t_Co=256 " vim-airline stuff
set encoding=utf-8
let g:airline_theme="solarized"
set background=light
let g:airline_powerline_fonts = 1
colorscheme solarized
hi Search cterm=NONE ctermfg=white ctermbg=blue
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
let NERDTreeQuitOnOpen=1


" highlights excess whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" thanks @dbotsford!
" toggles relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    "set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']

nnoremap <leader>n :call NumberToggle()<cr>

" jump 5 lines with C-jk
noremap <C-h> 5j
noremap <C-u> 5k
" jump 15 lines without moving cursor
map <C-f> 15<C-e>
map <C-g> 15<C-y>

map <C-a> A

" save/quit
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>
nmap <C-q> <esc>:q<cr>

" easy escape, braces
inoremap jk <ESC>
inoremap ;l <CR>
inoremap kk -
inoremap jj _
" inoremap []\ {<CR><BS>}<Esc>ko
inoremap []\ {<CR>}<Esc>ko


" syntax
au BufRead,BufNewFile *.md set filetype=markdown wrap spell syntax=off" markdown
au BufRead,BufNewFile *.fish set filetype=fish
au BufRead,BufNewFile *.rs set filetype=rust

" tagbar
map <leader>x :TagbarOpenAutoClose<cr>
map <leader>X :TagbarToggle<cr>
map <tab> :NERDTreeToggle<cr>

map <leader>e :lnext<cr>
map <leader>r :lprev<cr>

" gundo
nnoremap  <leader>c :GundoToggle<cr>

" de-highlight
map <leader>\ :noh<cr>

" vim-dispatch Make
map <leader>m :Make<cr>

" quick bash
map <leader>j :sh<cr>

" quick hl
nmap <leader>8 *N

" quick ag
nmap <leader>a :Ag<cr>

" paste
nnoremap <leader>p :set paste<cr>i
nnoremap <leader>P :set nopaste<cr>

" delete whitespace at EOL
nnoremap <leader>o <esc>A<bs><esc>

" toggle scrolloff
function! ScrollOffToggle()
  if(&scrolloff == 9999)
    set scrolloff=5
  else
    set scrolloff=9999
  endif
endfunc

nnoremap <leader>s :call ScrollOffToggle()<cr>

"wrap
function! WrapToggle()
  if(&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunc
nnoremap <leader>w :call WrapToggle()<cr>

" emacs key bindings
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-e> <End>
imap <C-a> <Home>
imap <C-d> <Del>
imap <C-h> <BS>

" easy tab movement (yes, this overrides the emacs C-n above
nnoremap <C-n> :tabprevious<cr>
nnoremap <C-m> :tabnext<cr>

"
" rust
"

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

