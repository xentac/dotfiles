" Set up pathogen
call pathogen#infect()

" General settings
colorscheme elflord

" Use zenburn in 256 color modes
if &term =~ "xterm-256color" || &term =~ "screen" || &term =~ "screen-256color"
    set t_Co=256
    colorscheme zenburn
    set termencoding=utf-8
endif

set colorcolumn=80

let mapleader = ","

" disable f1 and make it escape
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Default space width is 4
set ts=4
set sw=4
set sts=4

syntax on
"set noautoindent
"filetype indent off
filetype plugin on
"set nocindent
"set comments=
"set kp='man'
set nohlsearch
set nobackup
set ignorecase
set smartcase
set incsearch

set expandtab
set smarttab

set mouse=a
set ttymouse=xterm

" Make tab switching similar to browser
map <C-Tab> gt
map <C-S-Tab> gT

" Highlight the current line
set cursorline

set list listchars=tab:»\ ,trail:·,extends:…,nbsp:‗

" Hide pyc and swp files
let g:netrw_list_hide='\.pyc$,\.swp$'
set wildignore=*.swp,*.bak,*.pyc

" Remap W, Wq, and WQ to their respective lowercase options
command W :w
command Wq :wq
command WQ :wq
command Q :q

" Custom commands to make work stuff easier

" Munge emails that come out of the dbmail db
command! MB call EmailMunge()

function! EmailMunge()
    s/\\011/\t/g
    s/\\012//g
    set ft=mail
    normal ggOFrom god@heaven.af.mil Sat Jan  3 01:05:34 1996
endfunction

" Collapse ds-server.log lines
command! DS call DsCollapse()

function! DsCollapse()
    set foldexpr=getline(v:lnum)!~'^\\[\\d\\d\\d\\d-\\d\\d-\\d\\d\ \\d\\d:\\d\\d:\\d\\d,\\d\\d\\d\\]'?1:0
    set foldmethod=expr
    set foldenable
    set foldcolumn=2
    set fdo=block,hor,mark,percent,quickfix,tag,undo
    set hlsearch
endfunction

" coffee, cake, json, jade, and js files only have 2 spaces
au BufEnter *.coffee,Cakefile,*.json,*.jade,*.js set ts=2 sw=2 sts=2
" Make sure that opening python files sets spacing to 4
au BufEnter *.py set ts=4 sw=4 sts=4

function! FixFatboyEnv()
    let filepath = '^' . expand('%:p:h')
    if filepath =~ '/home/jchu/Private/coding/oprius/fatboy/devel'
        set noet nosta textwidth=0
        set sw=3 ts=3 sts=3
        set wildignore+=*/build/*,*/dist/*,*/help-auxiliary/*,*/doc/*
    endif
endfunction

au BufEnter *.py call FixFatboyEnv()
au BufEnter *.js call FixFatboyEnv()
au BufEnter *.css call FixFatboyEnv()

" Set the filetype of *.kid to xhtml
au BufRead *.kid set ft=xhtml

" Don't auto add comments on O, enter or auto wrap them
set formatoptions-=cro

" <leader>s does spellcheck (leader is ,)
nmap <silent> <leader>s :set spell!<CR>

" Canadian spelling
set spelllang=en_ca

" Toggle Gundo with F5
nnoremap <F5> :GundoToggle<CR>

" Make ,td open the Task List
map <leader>td <Plug>TaskList

" Toggle nerdtree with ,n
map <leader>n :NERDTreeToggle<CR>

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

" Let modified but unsaved buffers be hidden
set hidden

" Open taglist with F8
map <F8> :TlistToggle<CR>

set background=dark

map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.jpg$\|\.gif$\|\.png$' }

let g:notes_directory = '~/Dropbox/notes'
let g:notes_suffix = '.txt'

" Use ,t to prompt for note searches
nmap <leader>t :SearchNotes 
" Use ,h to start a note edit
nmap <leader>h :Note 
" Use ctrl-] to search for the text under the cursor
nmap <C-]> :SearchNotes<CR>
" In visual mode, create a note from the selected text
vmap <Leader>h :NoteFromSelectedText<CR>
" Use ,d to show recent notes
nmap <leader>d :RecentNotes<CR>
" Create a collect note just by pressing F7
nnoremap <F7> :Note! collect<CR>

" Configure khuno to use python2 flake8
let g:khuno_flake_cmd = 'flake8-python2'
let g:khuno_ignore="E128"
nmap <leader>k :Khuno off<CR>

nmap <leader>f :Ack<space>
nmap <leader>g :Ack <C-R><C-W><CR>
