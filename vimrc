set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'posva/vim-vue'
call vundle#end()

filetype plugin on

syntax enable
colorscheme solarized

"let g:racer_cmd = "/home/nishan/.cargo/bin/racer"
"let g:racer_insert_paren = 1
"let g:racer_experimental_completer = 1
let g:formatterpath = ['/usr/bin/vue-formatter', '/usr/bin/js-beautify']
let g:ycm_autoclose_preview_window_after_completion = 1
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set number relativenumber

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
autocmd FileType javascript noremap <buffer> <c-f> :%!js-formatter<CR>
autocmd FileType rust noremap <buffer> <c-f> :%RustFmt<CR>
vmap <silent><c-k> <Plug>NERDCommenterToggle
map <silent><c-k> <Plug>NERDCommenterToggle
map <C-\> :NERDTreeToggle<CR>
noremap <c-n> :tabn<CR>
noremap <c-p> :tabp<CR>
inoremap jj <ESC>
noremap <c-j> J  
noremap J <c-d>  
noremap K <c-u>  
