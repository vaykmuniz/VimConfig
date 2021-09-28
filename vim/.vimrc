set number
set relativenumber
set mouse=a
set inccommand=split
set tabstop=2
set expandtab
set cc=80
set clipboard=unnamedplus
"set spell
set noshowmode
set noerrorbells
set smartcase
set smartindent

set encoding=UTF-8

set splitright
set splitbelow

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c


let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

nnoremap <C-s> :w<CR>
nnoremap <C-S-q> :q<CR>

"Tab"

nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"nerd tree 

nnoremap <S-t> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
