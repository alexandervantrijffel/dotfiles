
  " Updates and installation
  " :SPUpdate spacevim
 "
  " manual step for a new machine: update colors in ~/.cache/vimfiles/repos/github.com/SpaceVim/vim-material/colors/material.vim with contens from:
  " https://github.com/alexandervantrijffel/vim-material

  " run 'yarn global add standard prettier-standard babel-eslint eslint@latest eslint-plugin-prettier eslint-plugin-react eslint-config-standard eslint-plugin-import eslint-plugin-standard eslint-plugin-react@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest neovim'

  " run 'pip3 install pynvim' for vim
  " and :GoInstallBinaries
  " or :GoUpdate
  " or later :GoUpdateBinaries
  "
  "
  " run :UpdateRemotePlugins for tssserver


  au VimEnter * call OnVimEnter()

  set expandtab
  set tabstop=2 
  set shiftwidth=2 
  set softtabstop=2
  set autoindent
  set nosmarttab
  

  set nolist
  " let g:indentLine_setConceal = 0 
  
  set ignorecase smartcase

  set splitright
  " prevent arbitrary code execution https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
  set nomodeline
  set noswapfile
  set hlsearch
  " yank to system clipboard
  set clipboard+=unnamed,unnamedplus
  " give more space for displaying messages
  set cmdheight=2
  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300
  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c
  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " for undo support
  set hidden 
  set undofile
  set undodir=$HOME/.vimundo/

  let g:auto_save = 1
  let g:auto_save_no_updatetime = 1
  let g:auto_save_in_insert_mode = 0
  let g:auto_save_silent = 1

  au CursorHold * checktime    

  " highlight search results
  set incsearch

  " live update of substitution
  set inccommand=nosplit
 
  " keep n lines below and above the cursor
  set scroll=5

  set number relativenumber
  " set absolute numbers in insert mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END

  let g:go_fmt_command = "goimports"
  let g:go_fmt_options = {
    \ 'goimports': '-w',
    \ }
  let g:go_fmt_autosave = 1
  " let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  let g:go_auto_type_info = 1

  " Override default ignore pattern in file tree to still
  " show other . files
  let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

  " autocomplete
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts"

  set completeopt+=noselect

  " this is necessary for the material theme to show correctly
  let g:spacevim_enable_guicolors = 1

  let g:spacevim_automatic_update = 1
  let g:spacevim_wrap_line = 1

  autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

  let g:rg_highlight = 'true'
  let g:rg_command = 'rg --vimgrep --hidden --smart-case --follow'


  " fzf.vim

  " jump to existing window if possible
  let g:fzf_buffers_jump = 1
  set termguicolors
  " the preview window of fzf uses bat so we have to configure bat theme here
  let $BAT_THEME='Monokai Extended Origin'


  " run `yarn global add import-js` for vim-import-js 
  "
  " useful: vim-jplus (join lines)
  " 'neosnippet-snippets', 'neosnippet.vim', 'neoyank.vim',
  "
  " Required to prevent format error with coc
  " neoformat,
  "
augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

function OnVimEnter()
  if @% == ""
    " No filename for current buffer
    :Files
  endif
endfunction
