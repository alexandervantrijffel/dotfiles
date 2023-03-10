" no cursors
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>

" left cursor in insert mode is used by vim-go plugin to move left
" after inserting () when calling a method, so we better not disable it
" inoremap  <Left>  <NOP>

noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Right> <NOP>

" " jump up/down row on screen instead of line in document
" nmap j <Left>
" nmap k gj
" nmap l gk

" " jump up/down row on screen instead of line in document
noremap j <Left>
noremap k gj
noremap l gk
noremap ; l

vnoremap j <Left>
vnoremap k gj
vnoremap l gk
vnoremap ; l

vnoremap   <Up>    <NOP>
vnoremap   <Down>  <NOP>
vnoremap   <Right> <NOP>

" Move line up/down
nnoremap <C-k> :m .+1<CR>==
nnoremap <C-l> :m .-2<CR>==

" move line up/down Insert mode
" (C-k is for digraph) for instance C-k j3 for ϵ
" inoremap <C-k> <ESC>:m .+1<CR>==gi
" inoremap <C-l> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-k> :m '>+1<CR>gv=gv
vno"emap <C-l> :m '<-2<CR>gv=gv

" split windows
nnoremap <A-j> <C-W><C-h>
nnoremap <A-k> <C-W><C-j>
nnoremap <A-l> <C-W><C-k>
nnoremap <A-;> <C-W><C-l>

set splitbelow
set splitright

" normalize window size
" <C-W> =

" swap top/bottom or left/right split
