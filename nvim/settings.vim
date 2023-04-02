set jumpoptions+=stack

" yank to system clipboard
set clipboard+=unnamed,unnamedplus
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" for undo support
set hidden 
set undofile
set undodir=$XDG_DATA_HOME/.vimundo
set undolevels=10000
set undoreload=10000

set completeopt+=noselect

" live update of substitution
set inccommand=nosplit

" set absolute numbers in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
