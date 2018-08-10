func! myspacevim#before() abort
  set wrap
  set ignorecase
  set smartcase
  " highlight search results
  set incsearch
  iunmap jk
  inoremap jj <esc>
  set clipboard+=unnamed

  " Normal mode
  nnoremap <C-j> :m .+1<CR>==
  nnoremap <C-k> :m .-2<CR>==

  " Insert mode
  inoremap <C-j> <ESC>:m .+1<CR>==gi
  inoremap <C-k> <ESC>:m .-2<CR>==gi

  " Visual mode
  vnoremap <C-j> :m '>+1<CR>gv=gv
  vnoremap <C-k> :m '<-2<CR>gv=gv
  " map s <Plug>(vim-easymotion-s)
  " nnoremap <SPACE> <Plug>(vim-easymotion-s2)
  map <leader>. <Plug>(vim-easymotion-prefix)
  let g:EasyMotion_do_mapping = 1
endf

func! myspacevim#after() abort
  exec "iunmap jk"
endf
