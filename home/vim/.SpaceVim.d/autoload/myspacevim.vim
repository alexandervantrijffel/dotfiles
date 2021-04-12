func! myspacevim#before() abort
  source $DOTFILES/home/vim/plugins.vim
  source $DOTFILES/home/vim/coc.vim
  source $DOTFILES/home/vim/abbr.vim

  set tabstop=2

  let g:mapleader = "'"

  au VimEnter * call OnVimEnter()

  set wrap
  set ignorecase
  set autoindent
  set smartcase
  set splitright
  " prevent arbitrary code execution https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
  set nomodeline
  set noswapfile
  set hlsearch
  set clipboard+=unnamed,unnamedplus

  let g:auto_save = 1
  let g:auto_save_no_updatetime = 1
  let g:auto_save_in_insert_mode = 0
  let g:auto_save_silent = 1

  " autocomplete
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts"

  au CursorHold * checktime    

  let g:indentLine_setConceal = 0 

  " highlight search results
  set incsearch

  " live update of substitution
  set inccommand=nosplit
 
  " keep n lines below and above the cursor
  set scroll=5

  set tabstop=2

  set number relativenumber
  " set absolute numbers in insert mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END


  " run 'yarn global add standard prettier-standard babel-eslint eslint@latest eslint-plugin-prettier eslint-plugin-react eslint-config-standard eslint-plugin-import eslint-plugin-standard eslint-plugin-react@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest neovim'

  " run 'pip3 install pynvim' for vim
  " and :GoInstallBinaries
  " or :GoUpdate
  " or later :GoUpdateBinaries
  "
  " When the installation of ack.vim fails, run this command:
  " git clone --config transfer.fsckObjects=false https://github.com/mileszs/ack.vim.git ~/.cache/vimfiles/repos/github.com/mileszs/ack.vim

  if executable('ag')
    let g:ackprg = 'ag --vimgrep --hidden -p ~/.gitignore '
  endif

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

  set completeopt+=noselect

  " :SPUpdate spacevim
  "
  " manual step for a new machine: update colors in ~/.cache/vimfiles/repos/github.com/SpaceVim/vim-material/colors/material.vim with contens from:
" https://github.com/alexandervantrijffel/vim-material
"
  " this is necessary for the material theme to show correctly
  let g:spacevim_enable_guicolors = 1

  let g:spacevim_automatic_update = 1

  let g:spacevim_disabled_plugins = [ 'deoplete.nvim', 'deoplete-dictionary', 'deoplete-go', 'deoplete-ternjs', 'gruvbox', 'onedark.vim', 'neomake', 'neoinclude.vim', 'neoformat', 'neomru.vim', 'neopairs.vim',  'nord-vim', 'molokai', 'open-browser.vim', 'echodoc.vim', 'NeoSolarized', 'conoline.vim', 'deol.nvim', 'editorconfig-vim', 'jellybeans.vim', 'neco-syntax', 'palenight.vim', 'vim-grepper', 'vim-mundo', 'vim-snippets', 'tern_for_vim', 'srcery-vim', 'vim-flow', 'tabular', 'tagbar', 'tagbar-makefile.vim', 'tagbar-proto.vim', 'wildfire.vim', 'vim-table-mode', 'vim-emoji', 'vim-hybrid', 'vimshell.vim', 'vim-expand-region', 'vim-textobj-entire', 'vim-textobj-indent', 'vim-textobj-line', 'vim-textobj-user', 'splitjoin.vim']

  " useful: vim-jplus (join lines)
  " 'neosnippet-snippets', 'neosnippet.vim', 'neoyank.vim',

  " close buffer with \bd or :Bclose
  :call InstallBclose()

endf

func! myspacevim#after() abort
  source $DOTFILES/home/vim/keymap.vim

  :call SetSpacevimWindowJkl()
endf

function OnVimEnter()
    if @% == ""
        " No filename for current buffer
        :FZF
    endif
endfunction

function SetSpacevimWindowJkl()
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

  " Display an error message.
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
