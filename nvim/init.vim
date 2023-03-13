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

function OnVimEnter()
  if index(v:argv, '+Rg') >= 0
    call RipgrepFzf('', 1)
  else 
    if @% == ""
      " No filename for current buffer
      :Files
    endif
  endif

   " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

command Rg exec
autocmd VimEnter * delcommand Rg

au CursorHold * checktime    

augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

