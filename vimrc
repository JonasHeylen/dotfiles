runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

syntax on
filetype on
set number
set listchars=tab:>.,trail:.,eol:$
" show whitespace
nmap <silent> <leader>s :set nolist!<CR>
" replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

set textwidth=90

set autowrite
nmap <silent> <leader>m :make<CR>

" tabs
" http://tedlogan.com/techblog3.html
set tabstop=4       " display tab as 4 columns
set softtabstop=4   " tab key indents 4 columns
set shiftwidth=4    " for autoindent and >> <<
set expandtab       " use spaces
set autoindent      " copy indent from previous line
set smartindent     " smart autoindenting

" Scala
" 
" 2-space indentation for Scala
" http://www.codecommit.com/scala-style-guide.pdf
au FileType scala set ts=2 sts=2 sw=2 et ai
" SBT
au FileType scala set makeprg=sbt\ compile
au FileType scala set efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,\%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,\%-G%.%#
" make sure to use -Dsbt.log.noformat=true when running sbt:
" if [ "$TERM" == "dumb" ]; then
"   JAVA_OPTS="-Dsbt.log.noformat=true"
" fi
"
" java -Xmx512M $JAVA_OPTS -jar `dirname $0`/sbt-launcher.jar "$@"
"au FileType scala copen
function! SbtTest ()
    set makeprg=sbt\ test
    make
    copen
    set makeprg=sbt\ compile
endfunction
nmap <silent> <leader>st :call SbtTest()<CR>

" Drupal
au BufNewFile,BufRead *.module set syn=php
au BufNewFile,BufRead *.install set syn=php

" CakePHP
au BufNewFile,BufRead *.thtml set syn=php

" close XML & HTML tags with ^_
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

" save as root
cmap w!! w !sudo tee % >/dev/null  

" colors
set background=dark
colorscheme solarized

" always display status line
set laststatus=2

" nerdtree
nmap <silent> <unique> <Leader>nt :NERDTreeToggle<CR>

" taglist
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nmap <silent> <unique> <Leader>tl :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

" tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <silent> <unique> <Leader>tb :TagbarToggle<CR>

" from http://items.sjbach.com/319/configuring-vim-right:

" shell-like tab completion
set wildmenu
set wildmode=list:longest

set hidden

set history=1000

" make % switch between if/else/..., opening/closing tags, ...
runtime macros/matchit.vim

" make / searches ignore case except when there is a capital in the search expression
set ignorecase 
set smartcase

set scrolloff=3

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" from http://github.com/elventails/vim/blob/master/vimrc:

set statusline=%F%m%r%h%w[tl:\ %L][%{&ff}]%y[%p%%][l:\ %04l,c:\ %04v]\(br:\ %{GitBranch()}\)
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

