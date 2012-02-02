" Environment
set nocompatible
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

" General
filetype plugin indent on
syntax on
set history=1000
set viewoptions=folds,options,cursor,unix,slash
set spell

" Set up directories
set undolevels=1000

" THE LOOK
set showmode
set cursorline

" Status Line
set laststatus=2
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}

set nu
set ruler
set so=5
set foldenable
set gdefault
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap=b,s,h,l,<,>,[,]
set mat=2
set showmatch
colorscheme desert
set guioptions-=T
" SEARCH
set ignorecase
set smartcase
set hlsearch
set incsearch

" TAB AND INDENT
retab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set lbr
set tw=500
set autoindent
set si " Smart indent
set wrap " wrap lines

" SIMPLE BACKEND
set showcmd
set autoread " auto read when a file is changed from the outside

" Remove trailing white space
autocmd FileType c,cpp,java,php,ruby,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Tab completion
set wildmenu
set wildmode=list:longest,full

" If this is ever needed, set jj to <esc>
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Display white space
set list!
set listchars=tab:>.,eol:$,trail:.,extends:#,nbsp:.
hi NonText ctermfg=7 guifg=gray
hi SpecialKey ctermfg=7 guifg=gray

" Update vim after each vimrc write
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Delimitmate 
au FileType * let b:delimitMate_autoclose = 1
au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],(:)"

" Ctags 
set tags=./tags;/,$HOME/vimtags
