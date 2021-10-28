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
"Autocomplete-lsp
 Plug 'nvim-lua/completion-nvim'
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
"Prettier
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Tema
"Plug 'jacoborus/tender.vim'
 Plug 'morhetz/gruvbox'

call plug#end()

"TEMA
let g:blamer_enabled = 1

let g:gruvbox_italic=1
if (has('termguicolors'))
  set termguicolors
  set background=dark
endif

syntax enable
colorscheme gruvbox



""NERDTREESITTER"
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
  }
EOF

"LSP saga

lua <<EOF
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
EOF

"Autocomplete

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach}
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = [ 'exact', 'substring', 'fuzzy' ]

"LSP

lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
 
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  end

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'rust_analyzer', 'tsserver' }
  for _, lsp in ipairs(servers) do
     nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

EOF

