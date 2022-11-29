
""""""""""""""GENERAL STUFF""""""""""""""""""
" use vim instead of vi mode
set nocompatible

" let backspace delete beyond start of insert
set backspace=indent,eol,start

" use more colors
" set t_Co=256

" expand path for file tab completion
set path+=**
set wildmenu

" highlight search results
set hlsearch

" highlight matching bracket
set showmatch

" show row numbers
set number

" fix tabs to spaces
set ts=4 sw=4 expandtab
set smarttab

" speaking of whitespace, let's show some
"set list
"set lcs=tab:>_,trail:-
"hi SpecialKey cterm=none ctermfg=black    ctermbg=darkyellow
"hi SpecialKey ctermfg=darkgrey

" start new line at same indent as previous
set autoindent
"
" set f2 to toggle paste mode (to prevent auto indenting when undesirable)
set pastetoggle=<F2>

" makes cursor change with mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" show status bar
set laststatus=2

" show location
set ruler

" don't wrap lines by default
set wrap!

" make vimdiff highlighing readable
"hi DiffAdd      cterm=none ctermfg=green    ctermbg=black
"hi DiffDelete   cterm=none ctermfg=darkred  ctermbg=black
"hi DiffChange   cterm=none ctermfg=none     ctermbg=black
"hi DiffText     cterm=none ctermfg=black    ctermbg=darkyellow

" add bash aliases to vim command shell
" TODO: make this work
"let $BASH_ENV="~/.bash_aliases"

" allow switching buffers with unsaved changes
set hidden

" mouse wheel scroll relative instead of moving cursor
" this breaks mintty copy paste which is currently more important
" set mouse=a

"no idea how this is getting turned on but turn it off!
set conceallevel=0


""""""""""""""FILE SPECIFIC STUFF""""""""""""""""""
" turn on syntax highlighting
syntax enable
filetype on
filetype plugin on
filetype indent on
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


""""""""""""""PLUGINS""""""""""""""""""
" Plug
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'Yggdroot/indentLine'
call plug#end()

" gruvbox
colorscheme gruvbox
set background=dark
" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


""""""""""""""""""""""""""""""""""""""""""""
""" append project specific .vimrc files """
set exrc
set secure

