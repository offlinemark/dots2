source ~/.vimrc.local

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
colorscheme solarized
hi Search cterm=NONE ctermfg=white ctermbg=blue
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let NERDTreeQuitOnOpen=1

" Vundle Setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vim plugins
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'majutsushi/tagbar'
Bundle 'dag/vim-fish'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'rking/ag.vim'

call vundle#end()

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

nnoremap <leader>n :call NumberToggle()<cr>

" jump 5 lines with C-jk
noremap <C-b> 5j
noremap <C-h> 5k
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
