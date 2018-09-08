func! myspacevim#before() abort
  set wrap
  set ignorecase
  set smartcase

  " highlight search results
  set incsearch

  " jump up/down row on screen instead of line in document
  nmap j gj
  nmap k gk
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

  let g:spacevim_custom_plugins = [
            \ ['pangloss/vim-javascript', {'merged' : 0}],
            \ ['mxw/vim-jsx', {'merged' : 0}],
            \ ['w0rp/ale', {'merged' : 0}],
            \ ['907th/vim-auto-save', {'merged' : 0}],
            \ ]

  let g:jsx_ext_required = 0 " Allow JSX in normal JS files 

  let g:ale_linters = {
            \   'javascript': ['standard'],
            \}
  let g:ale_fixers = {'javascript': ['standard']}

  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 1
  
  let g:auto_save = 1
endf

func! myspacevim#after() abort
  exec "iunmap jk"
  
endf
