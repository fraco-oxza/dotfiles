syntax enable

set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0

set termguicolors
set guioptions-=T

set cursorline

set hidden 
set path+=**
set nowrap
set encoding=UTF-8
set clipboard=unnamedplus

set number 
set mouse=

set smartindent
set smarttab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase
set incsearch
set nohlsearch
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set noswapfile
set nobackup
set undofile
execute 'set undodir=' . g:nvim_data_root . '/undodir'

set background=dark

let g:gruvbox_material_background='hard'
let g:gruvbox_material_foreground='material'
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_enable_italic=1

let g:loaded_perl_provider = 0

colorscheme gruvbox-material
