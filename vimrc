set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin on

syntax enable
set background=dark
colorscheme solarized

"let g:racer_cmd = "/home/nishan/.cargo/bin/racer"
"let g:racer_insert_paren = 1
"let g:racer_experimental_completer = 1
let g:formatterpath = ['/usr/bin/vue-formatter']
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled=1
let g:syntastic_javascript_checkers = ['syntastic-javascript-eslint']
let g:syntastic_javascript_checkers = ['syntastic-javascript-eslint']
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'

autocmd FileType vue noremap <buffer> <c-f> :%!vue-formatter<CR>
vmap <silent><c-k> <Plug>NERDCommenterToggle
noremap <c-n> :tabn<CR>
noremap <c-p> :tabp<CR>
