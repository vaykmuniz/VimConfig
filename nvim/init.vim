source ~/.config/vim/.vimrc

call plug#begin()

"Tela inicial para vim
 Plug 'mhinz/vim-startify'
"Ajuda no autocmplt
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
"LSP
 Plug 'neovim/nvim-lspconfig'
 Plug 'glepnir/lspsaga.nvim'
 Plug 'kabouzeid/nvim-lspinstall' 
"Telescope
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-lua/popup.nvim'
 Plug 'nvim-telescope/telescope.nvim'
"Tipo gitlens
 Plug 'airblade/vim-gitgutter'
"Highlight texto e outras chamadas
 Plug 'rrethy/vim-illuminate'
"Treesitter lindão 
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'APZelos/blamer.nvim'
"Barrinha inferior
 Plug 'vim-airline/vim-airline'
"AutoPair
 Plug 'jiangmiao/auto-pairs'
"Tema
" Plug 'jacoborus/tender.vim'
 Plug 'morhetz/gruvbox'

call plug#end()

"TEMA
let g:blamer_enabled = 1

if (has('termguicolors'))
  set termguicolors
endif

syntax enable
colorscheme gruvbox

let g:gruvbox_italic=1


""NERDTREESITTER"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
EOF

"LSP 

lua <<EOF
  local saga = require'lspsaga'
  saga.init_lsp_saga()
EOF
