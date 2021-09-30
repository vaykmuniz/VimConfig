source ~/.config/vim/.vimrc

syntax enable

call plug#begin()

 Plug 'neovim/nvim-lspconfig'
 Plug 'ghifarit53/tokyonight-vim'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'ryanoasis/vim-devicons'
 Plug 'APZelos/blamer.nvim'
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'sheerun/vim-polyglot
"Plug 'dracula/vim'
"Plug 'psliwka/vim-smoothie'

call plug#end()

" tema night ou storm "

let g:blamer_enabled = 1

if (has('termguicolors'))
        set termguicolors
endif

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
