func! myspacevim#before() abort
  set wrap
  set ignorecase
  set smartcase
  set splitright
  inoremap jj <esc>
  set clipboard+=unnamed

  " highlight search results
  set incsearch

  :set number relativenumber
  " set absolute numbers in insert mode
  :augroup numbertoggle
  :  autocmd!
  :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  :augroup END

  " move cursor to the end of the line while in insert mode (ALT+SHIFT+4)
  inoremap <A-$> <C-o>$
  inoremap <A-h> <Left>
  inoremap <A-l> <Right>

  " jump up/down row on screen instead of line in document
  nmap j gj
  nmap k gk

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
  " map <leader>. <Plug>(vim-easymotion-prefix)
  " let g:EasyMotion_do_mapping = 1

  let g:spacevim_automatic_update = 1

  let g:spacevim_custom_plugins = [
            \ ['pangloss/vim-javascript', {'merged' : 0}],
            \ ['mxw/vim-jsx', {'merged' : 0}],
            \ ['w0rp/ale', {'merged' : 0}],
            \ ['907th/vim-auto-save', {'merged' : 0}],
            \ ['fatih/vim-go', {'merged' : 0}],
            \ ['jodosha/vim-godebug', {'merged' : 0}],
            \ ['Shougo/deoplete.nvim', {'merged' : 0}],
            \ ['zchee/deoplete-go', {'merged' : 0}],
            \ ['majutsushi/tagbar', {'merged' : 0}],
            \ ['mileszs/ack.vim', {'merged' : 0}],
            \ ]

  " When the installation of ack.vim fails, run this command:
  " git clone --config transfer.fsckObjects=false https://github.com/mileszs/ack.vim.git ~/.cache/vimfiles/repos/github.com/mileszs/ack.vim

  " run 'pip3 install neovim' for vim
  " and :GoInstallBinaries
  let g:deoplete#enable_at_startup = 1
  let g:go_auto_sameids = 1
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_extra_types = 1
	let g:go_list_type = "quickfix"
	let g:go_fmt_command = "goimports"
  let g:go_metalinter_command = "gometalinter --config=" . $HOME . "/.gometalinter.json"
  let g:go_test_show_name=1
  let g:go_term_enabled = 1
  let g:go_auto_type_info = 1
  " 'snakecase' is also supported
  let g:go_addtags_transform = "camelcase"

  au FileType go nmap <leader>t :GoDeclsDir<cr>
  au FileType go nmap <leader><F12> :GoReferrers<cr>
  " alternative for gd
  au FileType go nmap <F12> <Plug>(go-def)

  " jump to next error
  map <C-n> :cnext<CR>
  map <C-m> :cprevious<CR>

  let g:jsx_ext_required = 0 " Allow JSX in normal JS files 

  let g:ale_linters = {
            \   'javascript': ['eslint'],
            \}
  " Run 'yarn global add prettier eslint babel-eslint eslint-plugin-react`' 
  " and (in project directory) 'eslint --init' for this one
  let g:ale_fixers = {'javascript': ['prettier','eslint']}

  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 1
  let g:auto_save = 1

  let g:ackprg = 'ag --vimgrep'
  nmap <leader>a :Ack! 
endf

func! myspacevim#after() abort
  exec "iunmap jk"
endf
