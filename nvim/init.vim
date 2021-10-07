source ~/.config/vim/.vimrc

syntax enable

call plug#begin()

"Plug 'neovim/nvim-lspconfig'
"Plug 'ghifarit53/tokyonight-vim'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'airblade/vim-gitgutter'
"Plug 'rinx/nvim-minimap'
 Plug 'severin-lemaignan/vim-minimap' 
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'ryanoasis/vim-devicons'
 Plug 'APZelos/blamer.nvim'
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'jacoborus/tender.vim'
 Plug 'vim-airline/vim-airline'

""Plug 'sheerun/vim-polyglot
"Plug 'dracula/vim'
"Plug 'psliwka/vim-smoothie'

call plug#end()

" tema night ou storm "

let g:blamer_enabled = 1

if (has('termguicolors'))
        set termguicolors
endif

colorscheme tender

"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1


autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


""NERDTREESITTER"

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

