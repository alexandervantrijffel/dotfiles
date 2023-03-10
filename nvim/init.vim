source $HOME/.config/nvim/settings.vim

source $HOME/.config/nvim/plugins.vim

luafile $HOME/.config/nvim/lualine.lua

source $HOME/.config/nvim/abbr.vim
source $HOME/.config/nvim/keymap.vim
source $HOME/.config/nvim/bclose.vim

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
