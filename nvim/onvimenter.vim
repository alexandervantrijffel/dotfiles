au VimEnter * call OnVimEnter()

function OnVimEnter()
  if index(v:argv, '+Rg') >= 0
    :RG
  else 
    if @% == ""
      " No filename for current buffer
      :Files
    endif
  endif

  call WeeklyPlugUpdate()
endfunction

command Rg exec
autocmd VimEnter * delcommand Rg

function WeeklyPlugUpdate()
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
