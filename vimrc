runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

syntax on
filetype on
set number
set listchars=tab:>.,trail:.,eol:$

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent

" Drupal
au BufNewFile,BufRead *.module set syn=php
au BufNewFile,BufRead *.install set syn=php

" CakePHP
au BufNewFile,BufRead *.thtml set syn=php

" close XML & HTML tags with ^_
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

" save as root
cmap w!! w !sudo tee % >/dev/null  

