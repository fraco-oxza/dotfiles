call plug#begin(stdpath('data').'/plugged')
    " Gruvbox Theme
    Plug 'sainnhe/gruvbox-material'
    Plug 'frazrepo/vim-rainbow'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
    Plug 'aklt/plantuml-syntax'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'tyru/open-browser.vim'

    " Translator
    Plug 'potamides/pantran.nvim'

    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'github/copilot.vim'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    Plug 'lervag/vimtex'

    " Airline status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Coc 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/vim-jsx-improve'

    " Colorizer 
    Plug 'norcalli/nvim-colorizer.lua'

    " Surround
    Plug 'tpope/vim-surround'

    " Fzf 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    
    " Vim FloaTerm
    Plug 'voldikss/vim-floaterm'

    " NERDCommenter
    Plug 'preservim/nerdcommenter'

    " NERDTree
    Plug 'preservim/nerdtree'
call plug#end()
