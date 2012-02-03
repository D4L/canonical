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

" Folds 
augroup vimrc
    au BufReadPost * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

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
map <Leader>d :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Command-t
let g:CommandTSearchPath = $HOME . '/workspace/Code'

"NerdTree
map <leader>w <C-w>w
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
let NERDTreeShowBooksmarks=1
let NERDTreeIgnore=['\.pfc', '\~$', '\.swp$', '\.git']
let NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd 1
    endif
endfunction

" Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let g:ctags_statusline=1
let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global'
