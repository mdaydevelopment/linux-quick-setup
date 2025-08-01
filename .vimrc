""""""""""""""GENERAL STUFF""""""""""""""""""
" stop ubuntu bug opens in replace
"set t_u7=
" this replaced first character in file with a g instead of opening in replace

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

" show relative row numbers
" set number
set relativenumber

" fix tabs to spaces
set ts=4 sw=4 expandtab
set smarttab

" speaking of whitespace, let's show some
" toggle list
" map <F3> :set list!<CR>
"set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
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

" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.c,*.cpp,*.h,*.hpp silent! !ctags . &
" ctrl t is going to be used by nerdtree, so we'll use ctrl [ to pop tag
noremap <C-[> :pop<CR>

""""""""""""""FILE SPECIFIC STUFF""""""""""""""""""
" turn on syntax highlighting
syntax enable
filetype on
filetype plugin on
filetype indent on
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType yaml set expandtab shiftwidth=2 softtabstop=2

""""""""""""""PLUGINS""""""""""""""""""
" Plug
call plug#begin()
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'vim-syntastic/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'Einenlum/yaml-revealer'
    Plug 'grafana/vim-alloy'
call plug#end()

" gruvbox
colorscheme gruvbox
set background=dark
" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" indentLine
let g:indentLine_setConceal = 0
" black
" map <F4> :Black<CR>
" rust
let g:syntastic_rust_checkers = ['cargo']

""""""""""""""""""""""""""""""""""""""""""""
"""" append local .vim files if present """"
runtime local.vim
" fix vim opens in replace on some machines
" put in .vim/local.vim
" set term=kitty

""""""""""""""""""""""""""""""""""""""""""""
""" append project specific .vimrc files """
set exrc
set secure
