source ~/.config/vim/.vimrc

call plug#begin()

"Tela inicial para vim
 Plug 'mhinz/vim-startify'
"Ajuda no autocmplt
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
"LSP
 Plug 'neovim/nvim-lspconfig'
 Plug 'kabouzeid/nvim-lspinstall' 
 Plug 'glepnir/lspsaga.nvim'
"Autocomplete
 Plug 'ackyshake/VimCompletesMe'
"Telescope
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-lua/popup.nvim'
 Plug 'nvim-telescope/telescope.nvim'
"PRA MERG e + - e gitlens
 Plug 'airblade/vim-gitgutter'
 Plug 'APZelos/blamer.nvim'
"Highlight texto e outras chamadas
 Plug 'rrethy/vim-illuminate'
"Treesitter lindão 
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Barrinha inferior
 Plug 'vim-airline/vim-airline'
"AutoPair
 Plug 'jiangmiao/auto-pairs'
"Prettier
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Tema
"Plug 'jacoborus/tender.vim'
 Plug 'morhetz/gruvbox'

call plug#end()

"TEMA
let g:blamer_enabled = 1

if (has('termguicolors'))
  set termguicolors
  set background=dark
endif

syntax enable
colorscheme gruvbox

let g:gruvbox_italic=1


""NERDTREESITTER"
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
  }
EOF

"Autocomplete

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = [ 'exact', 'substring', 'fuzzy' ]

"LSP

lua << EOF
  -- local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
 
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '!', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  end

  local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
      require'lspconfig'[server].setup{
        on_attach = on_attach,
      }
    end
  end
  
  setup_servers()

  require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end

EOF

