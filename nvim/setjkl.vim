"  let s:file = expand('<sfile>:~')
"  let s:funcbeginline =  expand('<slnum>') + 1
"  let s:lnum = expand('<slnum>') + s:funcbeginline
"  call SpaceVim#mapping#space#def('nnoremap', ['w', 'j'], 'wincmd h',
"        \ ['window-left',
"        \ [
"        \ '[SPC w j] is to jump to the left window',
"        \ '',
"        \ 'Definition: ' . s:file . ':' . s:lnum,
"        \ ]
"        \ ]
"        \ , 1)
"  let s:lnum = expand('<slnum>') + s:funcbeginline
"  call SpaceVim#mapping#space#def('nnoremap', ['w', 'k'], 'wincmd j',
"        \ ['window-down',
"        \ [
"        \ '[SPC w k] is to jump to the window below current windows',
"        \ '',
"        \ 'Definition: ' . s:file . ':' . s:lnum,
"        \ ]
"        \ ]
"        \ , 1)
"  let s:lnum = expand('<slnum>') + s:funcbeginline
"  call SpaceVim#mapping#space#def('nnoremap', ['w', 'l'], 'wincmd k',
"        \ ['window-up',
"        \ [
"        \ '[SPC w l] is to jump to the window above current windows',
"        \ '',
"        \ 'Definition: ' . s:file . ':' . s:lnum,
"        \ ]
"        \ ]
"        \ , 1)
"  let s:lnum = expand('<slnum>') + s:funcbeginline
"  call SpaceVim#mapping#space#def('nnoremap', ['w', ';'], 'wincmd l',
"        \ ['window-right',
"        \ [
"        \ '[SPC w ;] is to jump to the right window',
"        \ '',
"        \ 'Definition: ' . s:file . ':' . s:lnum,
"        \ ]
"        \ ]
"        \ , 1)

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

" Normal mode
nnoremap <C-k> :m .+1<CR>==
nnoremap <C-l> :m .-2<CR>==

" Insert mode
" (C-k is for digraph) for instance C-k j3 for ϵ
" inoremap <C-k> <ESC>:m .+1<CR>==gi
" inoremap <C-l> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-k> :m '>+1<CR>gv=gv
vnoremap <C-l> :m '<-2<CR>gv=gv

