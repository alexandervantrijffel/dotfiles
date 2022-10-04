func! myspacevim#before() abort
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

  source $DOTFILES/vim/plugins.vim
  source $DOTFILES/vim/coc.vim
  source $DOTFILES/vim/abbr.vim

  let g:mapleader = "'"

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
  let g:go_fmt_autosave = 0
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

  " close buffer with \bd or :Bclose
  :call InstallBclose()

endf

func! myspacevim#after() abort
  source $DOTFILES/vim/keymap.vim

  :call SetSpacevimWindowJkl()
endf

function OnVimEnter()
  if @% == ""
    " No filename for current buffer
    :Files
  endif

endfunction

function SetSpacevimWindowJkl()
  let s:file = expand('<sfile>:~')
  let s:funcbeginline =  expand('<slnum>') + 1
  let s:lnum = expand('<slnum>') + s:funcbeginline
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'j'], 'wincmd h',
        \ ['window-left',
        \ [
        \ '[SPC w j] is to jump to the left window',
        \ '',
        \ 'Definition: ' . s:file . ':' . s:lnum,
        \ ]
        \ ]
        \ , 1)
  let s:lnum = expand('<slnum>') + s:funcbeginline
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'k'], 'wincmd j',
        \ ['window-down',
        \ [
        \ '[SPC w k] is to jump to the window below current windows',
        \ '',
        \ 'Definition: ' . s:file . ':' . s:lnum,
        \ ]
        \ ]
        \ , 1)
  let s:lnum = expand('<slnum>') + s:funcbeginline
  call SpaceVim#mapping#space#def('nnoremap', ['w', 'l'], 'wincmd k',
        \ ['window-up',
        \ [
        \ '[SPC w l] is to jump to the window above current windows',
        \ '',
        \ 'Definition: ' . s:file . ':' . s:lnum,
        \ ]
        \ ]
        \ , 1)
  let s:lnum = expand('<slnum>') + s:funcbeginline
  call SpaceVim#mapping#space#def('nnoremap', ['w', ';'], 'wincmd l',
        \ ['window-right',
        \ [
        \ '[SPC w ;] is to jump to the right window',
        \ '',
        \ 'Definition: ' . s:file . ':' . s:lnum,
        \ ]
        \ ]
        \ , 1)
endfunction

function InstallBclose()
  " Delete buffer while keeping window layout (don't close buffer's windows).
  " Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
  if v:version < 700 || exists('loaded_bclose') || &cp
    finish
  endif
  let loaded_bclose = 1
  if !exists('bclose_multiple')
    let g:bclose_multiple = 1

  endif
  function! s:Warn(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl NONE
  endfunction

  " Command ':Bclose' executes ':bd' to delete buffer in current window.
  " The window will show the alternate buffer (Ctrl-^) if it exists,
  " or the previous buffer (:bp), or a blank buffer if no previous.
  " Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
  " An optional argument can specify which buffer to close (name or number).
  function! s:Bclose(bang, buffer)
    if empty(a:buffer)
      let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
      let btarget = bufnr(str2nr(a:buffer))
    else
      let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
      call s:Warn('No matching buffer for '.a:buffer)
      return
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
      call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
      return
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
      call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
      return
    endif
    let wcurrent = winnr()
    for w in wnums
      execute w.'wincmd w'
      let prevbuf = bufnr('#')
      if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
        buffer #
      else
        bprevious
      endif
      if btarget == bufnr('%')
        " Numbers of listed buffers which are not the target to be deleted.
        let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
        " Listed, not target, and not displayed.
        let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
        " Take the first buffer, if any (could be more intelligent).
        let bjump = (bhidden + blisted + [-1])[0]
        if bjump > 0
          execute 'buffer '.bjump
        else
          execute 'enew'.a:bang
        endif
      endif
    endfor
    execute 'bdelete'.a:bang.' '.btarget
    execute wcurrent.'wincmd w'
  endfunction
  command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
  nnoremap <silent> <Leader>bd :Bclose<CR>
endfunction
