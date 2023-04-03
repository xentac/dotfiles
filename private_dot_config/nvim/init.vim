set nocompatible
filetype off
let g:deoplete#enable_at_startup = 1

packloadall

function! PackInit() abort
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here
  call minpac#add('jmcantrell/vim-virtualenv')
  call minpac#add('Shougo/deoplete.nvim', {'do': 'silent! UpdateRemotePlugins'})
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('jnurmine/Zenburn')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('nathangrigg/vim-beancount')

endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
command! PackUpdateAndQuit call PackInit() | call minpac#update('', {'do': 'quit'})

function! s:has_colorscheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if s:has_colorscheme('gruvbox')
  colorscheme gruvbox
else
  colorscheme desert
endif

filetype plugin indent on

set shiftwidth=2 tabstop=2 softtabstop=2
set expandtab smarttab

set nohlsearch
set mouse=
set nobackup

set smartcase ignorecase

set relativenumber

set autoindent smartindent nocindent
inoremap # #

set hidden

hi CursorLine   cterm=NONE ctermbg=22 ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=22 ctermfg=white guibg=darkred guifg=white
set cursorline

" Map F1 to Esc to stop accidental clicks
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Use , as leader
let mapleader = ","

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

" Don't parse modelines, it's dangerous
set nomodeline

" Things to make beancount easier
noremap <Leader>1 :make<CR>
noremap <Leader>2 :cp<CR>
noremap <Leader>3 :cn<CR>
noremap <Leader>4 :cw<CR>
nnoremap <buffer> <LocalLeader>c :GetContext<CR>
