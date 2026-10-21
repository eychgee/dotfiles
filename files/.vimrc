call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

"configure LSP
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1            " gutter marker on every line with a problem
let g:lsp_diagnostics_virtual_text_enabled = 0     " no inline text on every line
let g:lsp_diagnostics_echo_cursor = 1              " full message on the command line when cursor is on the line

" Show the popup automatically while typing
let g:asyncomplete_auto_popup = 1

" Don't auto-insert the first match
set completeopt=menuone,noinsert,noselect,preview

" Tab / Shift-Tab to move through the menu, Enter to accept
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info -> ['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

"Stock settings
set encoding=utf-8
set ffs=unix,dos,mac

set ruler
set number
set relativenumber

set laststatus=2 "always show the status line

set tabstop=4
set shiftwidth=4 
set expandtab "spaces, not tabs
set autoindent
set smartindent

set colorcolumn=120

set splitbelow
set splitright

set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic 
set mat=2

set foldcolumn=1

"Colors and Fonts
syntax enable
colorscheme slate
set background=dark

"Markdown support
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
"TMUX support
set mouse=a
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
