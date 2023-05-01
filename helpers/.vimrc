set nocompatible
set nu
set rnu
filetype off
syntax enable
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamed
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

set wrap
set textwidth=79

call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

"ultisnips config
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Vimtex config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_method = 'latexmk'

"Python irritating feature disable
let g:pymode_doc = 0
"End this python case


au BufNewFile, BufRead *.py
   " \ set tabstop=4
   " \ set softtabstop=4
   " \ set shiftwidth=4
   " \ set textwidth=79
   " \ set expandtab
   " \ set autoindent
   " \ set fileformat=unix
  
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"let python_highlight_all=1

