set number
set tabstop=4
set shiftwidth=4
set showmode
set showmatch
set splitbelow
set splitright
set nohlsearch

"set leader key
let mapleader="\<SPACE>"

"enter in normal mode creates a new line
nmap <CR> o<Esc>

"maybe this helps with easymotion
map <Leader> <Plug>(easymotion-prefix)

"neovim stuff -------------------------------
call plug#begin('~/.config/nvim/autoload/')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'floobits/floobits-neovim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'altercation/vim-colors-solarized'
Plug 'euclio/vim-markdown-composer'
" Plug 'ervandew/supertab'

call plug#end()
"neovim stuff -------------------------------

"airline stuff ------------------------------


" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline#extensions#tabline#right_sep = '<'
" let g:airline#extensions#tabline#right_alt_sep = '<'

set encoding=utf-8
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = '>'
" let g:airline_left_alt_sep = '>'
" let g:airline_right_sep = '<'
" let g:airline_right_alt_sep = '<'
let g:airline_theme= 'molokai'

" let g:airline_section_b = '%{strftime("%c")}'
" let g:airline_section_y = 'BN: %{bufnr("%")}'
" let g:airline_theme= 'serene'

let g:airline#extensions#tabline#enabled = 1


"airline stuff ------------------------------

"deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
set completeopt-=preview
" inoremap <silent><expr> <Tab>
"		\ pumvisible() ? "\<C-n>" :
"		\ deoplete#mappings#manual_complete()

" tab for deoplete
imap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" switch between buffers with CTRL+h CTRL+l
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" ugly but visible matching brackets, parens, etc
highlight MatchParen cterm=none ctermbg=red ctermfg=darkgreen

" very large undo history even after closing file
set history=1000
set undodir=~/.vim/undodir
set undofile
set undolevels=800
set undoreload=10000

" force *.md to be markdown files
" also need this for instant-markdown-d
" filetype plugin on
" for vim-markdown-composer
let g:markdown_composer_browser='chromium'
let g:markdown_composer_autostart=1
let g:markdown_composer_open_browser=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
