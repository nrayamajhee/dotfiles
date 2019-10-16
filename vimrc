set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin on

syntax enable
colorscheme solarized

set hidden

"let g:racer_cmd = "/home/nishan/.cargo/bin/racer"
"let g:racer_insert_paren = 1
"let g:racer_experimental_completer = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = ''

let g:formatterpath = ['/usr/bin/vue-formatter']
let g:ycm_autoclose_preview_window_after_completion = 1
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set number relativenumber
let g:NERDTreeWinSize=25

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled=1
let g:syntastic_javascript_checkers = ['syntastic-javascript-eslint']

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
autocmd FileType vue noremap <buffer> <c-f> :%!vue-formatter<CR>
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<CR>
autocmd FileType rust noremap <buffer> <c-f> :RustFmt<CR>
vmap <silent># <Plug>NERDCommenterToggle
map <silent># <Plug>NERDCommenterToggle
map <C-\> :NERDTreeFocus<CR>
map <c-s> :AirlineRefresh <bar> :so ~/.vimrc<CR>
nnoremap <Leader>w <C-w>
map <c-w> :bd<CR>
noremap <c-n> :bn<CR>
noremap <c-p> :bp<CR>
inoremap jj <ESC>
noremap J <c-d>
noremap K <c-u>
noremap L J  
noremap <c-j> <c-y> 
noremap <c-k> <c-e>
