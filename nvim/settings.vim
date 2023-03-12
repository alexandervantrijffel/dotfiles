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
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" for undo support
set hidden 
set undofile
set undodir=$XDG_DATA_HOME/.vimundo
set undolevels=10000
set undoreload=10000

set completeopt+=noselect

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

set termguicolors

let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

