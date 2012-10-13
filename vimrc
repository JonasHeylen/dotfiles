" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:

call pathogen#infect()

" General {
let mapleader=","
syntax on
filetype plugin indent on
set number
set textwidth=80
set fo-=t

set hidden

set wildmenu
set wildmode=list:longest

set hlsearch
set incsearch

set grepprg=ack
" }

" Appearance {
set background=dark
colorscheme solarized

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
" }

" Tabstop {
set tabstop=4       " display tab as 4 columns
set softtabstop=4   " tab key indents 4 columns
set shiftwidth=4    " for autoindent and >> <<
set expandtab       " use spaces
set autoindent      " copy indent from previous line
set smartindent     " smart autoindenting
" }

" Mappings {

" replace word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

set listchars=tab:>.,trail:.,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" save as root
cmap w!! w !sudo tee % >/dev/null 

" bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" }

" Plugins {

" NERDTree {
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeShowHidden=1
" }

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
"}

" VimClojure {
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
" }

" No config needed: Ctrl-P, NERDCommenter, Syntastic, vim-surround

" }

" Languages, Frameworks & Tools {

" Python {
au FileType python set foldmethod=indent
" }

" Scala {
au FileType scala set ts=2 sts=2 sw=2 et ai
" }

" Gradle {
au BufNewFile,BufRead *.gradle setf groovy
" }

" Drupal {
au BufNewFile,BufRead *.module set syn=php
au BufNewFile,BufRead *.install set syn=php
" }

" CakePHP {
au BufNewFile,BufRead *.thtml set syn=php
" }

" Vagrant {
au BufNewFile,BufRead Vagrantfile set syn=ruby
" }

" }


" References
" ==========
"
" * http://tedlogan.com/techblog3.html (tabstop)
" * http://vimcasts.org/episodes/bubbling-text/
" * http://github.com/elventails/vim/blob/master/vimrc
" * https://github.com/spf13/spf13-vim
" * http://items.sjbach.com/319/configuring-vim-right
"
