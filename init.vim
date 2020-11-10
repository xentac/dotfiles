set nocompatible
colorscheme desert
filetype off
let g:deoplete#enable_at_startup = 1

packloadall

function! PackInit() abort
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here
  call minpac#add('Shougo/deoplete.nvim', {'do': 'silent! UpdateRemotePlugins'})
  call minpac#add('itchyny/lightline.vim')
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
command! PackUpdateAndQuit call PackInit() | call minpac#update('', {'do': 'quit'})

filetype plugin indent on

set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab

set nohlsearch
set mouse=

set smartcase ignorecase

hi CursorLine   cterm=NONE ctermbg=22 ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=22 ctermfg=white guibg=darkred guifg=white
set cursorline

" Map F1 to Esc to stop accidental clicks
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Add some capitalization changes because they're annoying
command W :w
command Wq :wq
command WQ :wq
command Q :q

" Allow ctrl-j, ctrl-k, etc for window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Allow ctrl-left, ctrl-right, etc for window movement
map <c-Down> <c-w>j
map <c-Up> <c-w>k
map <c-Right> <c-w>l
map <c-Left> <c-w>h

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Enable live substitute in neovim
set inccommand=split
