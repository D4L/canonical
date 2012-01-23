" THE LOOK
set nu
set ruler
set so=7
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap +=<,>,h,l
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
set smarttab
set lbr
set tw=500
set autoindent
set si " Smart indent
set wrap " wrap lines

" SIMPLE BACKEND
set nocompatible
set showcmd
set history=700
filetype plugin on
filetype plugin indent on
syntax enable
filetype indent on
set autoread " auto read when a file is changed from the outside

" Remove trailing white space
autocmd BufEnter,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Tab completion
set wildmenu
set wildmode=list:longest,full

" If this is ever needed, set jj to <esc>
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Display white space
set list!
set listchars=tab:>-,eol:$,trail:.
hi NonText ctermfg=7 guifg=gray
hi SpecialKey ctermfg=7 guifg=gray

" Autoappend closing braces
  " Brace Stuff
    inoremap {  {}<Left>
    inoremap {<bs>  {<bs>
    inoremap {<CR>  {<CR>}<Esc>O<tab>
    inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

  " Bracket Stuff
    inoremap (  ()<Left>
    inoremap <expr> ( DetermineBracket()
    inoremap (<bs>  (<bs>
    inoremap (<CR>  (<CR>)<Esc>O<tab>
    inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
    inoremap <expr> <bs> (strpart(getline('.'), col('.')-1, 1) == ")" && strpart(getline('.'), col('.')-2, 1) == "(" ) ? "\<esc>xxa" : "<bs>"
    function! DetermineBracket()
        let line = getline('.')
        let col = col('.')
        if line[col - 2] == " " && line[col - 1] != " " && strlen(line[col - 1]) != 0
            return "("
        else
            return "()\<left>"
        endif
    endfunction

  " Square Bracket Stuff
    inoremap [  []<Left>
    inoremap [<bs>  [<bs>j
    inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Autofix quotations
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap "<BS>  "<BS>
inoremap ' <c-r>=QuoteDelim("'")<CR>
inoremap '<BS>  '<BS>
function! QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endf

" Update vim after each vimrc write
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Status Line
set laststatus=2
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}
