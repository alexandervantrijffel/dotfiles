source $XDG_CONFIG_HOME/nvim/settings.vim

source $XDG_CONFIG_HOME/nvim/plugins.vim

source $XDG_CONFIG_HOME/nvim/abbr.vim
source $XDG_CONFIG_HOME/nvim/keymap.vim
source $XDG_CONFIG_HOME/nvim/bclose.vim


" slate
" list colorschemes:
" :colorscheme <C-d>
colorscheme material

let g:rainbow_active = 1

au VimEnter * call OnVimEnter()

au CursorHold * checktime    

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
