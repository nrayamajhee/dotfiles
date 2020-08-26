call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

filetype plugin on

syntax enable
colorscheme solarized

set hidden
set clipboard=unnamedplus

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
set clipboard+=unnamedplus

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


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd FileType javascript noremap <buffer> <c-f> :call jsbeautify<CR>
autocmd FileType html noremap <buffer> <c-f> :Neoformat htmlbeautify<CR>
autocmd FileType css noremap <buffer> <c-f> :Neoformat cssbeautify<CR>
autocmd FileType vue noremap <buffer> <c-f> :%!vue-formatter<CR>
autocmd FileType rust noremap <buffer> <c-f> :RustFmt<CR>
vmap <silent># <Plug>NERDCommenterToggle
map <silent># <Plug>NERDCommenterToggle
map <C-\> :NERDTreeFocus<CR>
map <c-s> :AirlineRefresh <bar> :so ~/.config/nvim/init.vim<CR>
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

set mouse=a
