"Plugins
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ayu-theme/ayu-vim'
call plug#end()

filetype plugin on
setlocal spell spelllang=en_us

"Editor Looks
syntax enable
setlocal spell spelllang=en_us
colorscheme ayu
set termguicolors

"Editing
set mouse=a
set hidden
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set clipboard+=unnamedplus
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd FocusGained,InsertLeave * set relativenumber
  autocmd FocusLost,InsertEnter   * set norelativenumber
augroup END


"Airline Vim
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_mirage'
let g:airline#extensions#tabline#enabled=1

let g:NERDTreeWinSize=25

" Detect fs vs files as glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" CoC Vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


"Key Bdingings
noremap <c-f> :Neoformat <CR>
autocmd FileType rust noremap <buffer> <c-f> :RustFmt <CR>
vmap <silent># <Plug>NERDCommenterToggle
map <silent># <Plug>NERDCommenterToggle
map <C-\> :CocCommand explorer --toggle --sources=buffer+,file+ --width 30<CR>
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let ayucolor="dark"
