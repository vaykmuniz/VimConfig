source ~/.config/vim/.vimrc

syntax enable

call plug#begin()

" Plug 'neovim/nvim-lspconfig'
 Plug 'ghifarit53/tokyonight-vim'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
" Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
 "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 "Plug 'ryanoasis/vim-devicons'
 Plug 'APZelos/blamer.nvim'
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'wfxr/minimap.vim'

"Plug 'sheerun/vim-polyglohht
"Plug 'dracula/vim'
"Plug 'psliwka/vim-smoothie'

call plug#end()

" tema night ou storm "

if (has('termguicolors'))
        set termguicolors
endif

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight


"NerdTree autoclose

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"Config minimap

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
