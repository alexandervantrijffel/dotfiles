func! myspacevim#before() abort
  " manual step for a new machine: update colors in ~/.cache/vimfiles/repos/github.com/SpaceVim/vim-material/colors/material.vim with contens from:
" https://github.com/alexandervantrijffel/vim-material

  let g:mapleader = "'"

  " this is necessary for the material theme to show correctly
  let g:spacevim_enable_guicolors = 1

  set wrap
  set ignorecase
  set smartcase
  set splitright
  " prevent arbitrary code execution https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
  set nomodeline
  set noswapfile
  set hlsearch
  " autosave
  let g:auto_save = 1
  let g:auto_save_no_updatetime = 1
  let g:auto_save_in_insert_mode = 0
  let g:auto_save_silent = 1

  let g:spacevim_enable_vimfiler_welcome = 0

  " update with :OmniSharpInstall
  let g:OmniSharp_server_stdio = 1
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  set completeopt+=preview
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " autocomplete
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"

  au CursorHold * checktime    

  set clipboard+=unnamed,unnamedplus
  let g:indentLine_setConceal = 0 

  " highlight search results
  set incsearch

  " live update of substitution
  set inccommand=nosplit

  set number relativenumber
  " set absolute numbers in insert mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END

  " run 'yarn global add standard prettier-standard babel-eslint eslint eslint-plugin-prettier' for this
  let g:ale_linters = {
            \   'javascript': ['standard'],
            \   'go': ['golangci-lint'],
            \   'cs': ['OmniSharp'],
            \}
  " \   'go': ['gopls'],
  let g:ale_fixers = {'javascript': ['prettier-standard']}
  let g:ale_list_window_size = 10
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files 
  let g:ale_completion_enabled = 1
  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 0
  let g:ale_go_golangci_lint_options = '-E goimports -D typecheck'


  let g:spacevim_automatic_update = 1

  " based on dein.vim plugin manager
  " Update with :DeinUpdate or :SPUpdate
  " update / install others with :UpdateRemotePlugins
  let g:spacevim_custom_plugins = [
            \ ['junegunn/fzf.vim', {'merged' : 0}],
            \ ['tpope/vim-fugitive', {'merged' : 0}],
            \ ['wsdjeg/dein-ui.vim', {'merged' : 0}],
            \ ['pangloss/vim-javascript', {'merged' : 0}],
            \ ['mxw/vim-jsx', {'merged' : 0}],
            \ ['w0rp/ale', {'merged' : 0}],
            \ ['907th/vim-auto-save', {'merged' : 0}],
            \ ['fatih/vim-go', {'merged' : 0}],
            \ ['jodosha/vim-godebug', {'merged' : 0}],
            \ ['Shougo/deoplete.nvim', {'merged' : 0}],
            \ ['zchee/deoplete-go', {'merged' : 0}],
            \ ['mdempsky/gocode', {'merged' : 0, 'rtp': 'nvim/', 'do': '~/.cache/vimfiles/repos/github.com/mdempsky/gocode/nvim/symlink.sh'}],
            \ ['majutsushi/tagbar', {'merged' : 0}],
            \ ['mileszs/ack.vim', {'merged' : 0}],
            \ ['airblade/vim-gitgutter.git', {'merged' : 0}],
            \ ['tpope/vim-fugitive', {'merged' : 0}],
            \ ['tpope/vim-commentary', {'merged' : 0}],
            \ ['tbodt/deoplete-tabnine', {'merged' : 0}],
            \ ['prabirshrestha/asyncomplete.vim', {'merged' : 0}],
            \ ['yami-beta/asyncomplete-omni.vim', {'merged' : 0}],
            \ ['chrisbra/Colorizer', {'merged' : 0}],
            \ ['airblade/vim-gitgutter.git', {'merged' : 0}],
            \ ['yuttie/comfortable-motion.vim', {'merged' : 0}],
            \ ['peitalin/vim-jsx-typescript', {'merged' : 0}],
            \ ['HerringtonDarkholme/yats.vim', {'merged' : 0}],
            \ ['yuezk/vim-js', {'merged' : 0}],
            \ ['maxmellon/vim-jsx-pretty', {'merged' : 0}],
            \ ]

  " run 'pip3 install pynvim' for vim
  " and :GoInstallBinaries
  " or :GoUpdate
  " or later :GoUpdateBinaries
  "
  " :SPUpdate spacevim
  
  " for deoplete-tabnine run install.sh in $HOME/.cache/. .... tbodt/deoplete-tabnine 
  " to install in case of errors
  " to update pull repo ~/.cache/vimfiles/repos/github.com/zxqfl/tabnine-vimu

  " homebrew
  set rtp+=/usr/local/opt/fzf 
  " rest
  set rtp+=~/.fzf

  " When the installation of ack.vim fails, run this command:
  " git clone --config transfer.fsckObjects=false https://github.com/mileszs/ack.vim.git ~/.cache/vimfiles/repos/github.com/mileszs/ack.vim

  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  let g:go_fmt_command = "goimports"
  let g:go_fmt_autosave = 0
  let g:go_info_mode='gopls'

  let g:deoplete#enable_at_startup = 1
  " autocomplete
  let g:deoplete#sources#go#pointer = 1
  let g:deoplete#sources#go#builtin_objects = 1
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  set completeopt+=noselect

  :call CustomMappings()

  " close buffer with \bd or :Bclose
  :call InstallBclose()

endf

func! myspacevim#after() abort
endf

function CustomMappings()
  nmap Y y$

  nnoremap <C-p> :FZF<CR>

  nmap <leader>a :Ack 

  au FileType javascript nmap <A-f> :ALEFix<cr>:w<cr>

  " Run this for go:
  " go get -u github.com/sourcegraph/go-langserver
  au FileType go nmap <leader>r :GoRename<cr>
  au FileType go nmap <leader>t :GoDeclsDir<cr>
  au FileType go nmap <leader>i :GoInfo<cr>
  au FileType go nmap <F12> :GoReferrers<cr>

  au FileType go nmap <A-f> :GoFmt<cr>:w<cr>:GoBuild<cr>

  au FileType go nmap gi :GoInfo<cr>
  nnoremap <C-p> :FZF<CR>
  au FileType javascript nmap <A-f> :ALEFix<cr>:w<cr>

  " Run this for go:
  " go get -u github.com/sourcegraph/go-langserver
  au FileType go nmap <leader>r :GoRename<cr>
  au FileType go nmap <leader>t :GoDeclsDir<cr>
  au FileType go nmap <leader>i :GoInfo<cr>
  au FileType go nmap <leader><F12> :GoReferrers<cr>

  au FileType go nmap <A-f> :GoFmt<cr>:w<cr>:GoBuild<cr>

  au FileType go nmap gi :GoInfo<cr>

  " move cursor to the end of the line while in insert mode (ALT+SHIFT+4)
  inoremap <A-$> <C-o>$
  inoremap <A-^> <C-o>^
  inoremap <A-h> <Left>
  inoremap <A-j> <Esc>j
  inoremap <A-k> <Esc>k
  inoremap <A-l> <Right>
  inoremap <A-O> <C-O>O
  inoremap <A-o> <C-o>o

  " no esc
  inoremap jj <esc>
  inoremap <C-c> <esc>uu
  noremap <C-q> :q<esc>
  inoremap  <esc> <NOP>

  " no cursors
  inoremap  <Up>    <NOP>
  inoremap  <Down>  <NOP>

  " left cursor in insert mode is used by vim-go plugin to move left
  " after inserting () when calling a method, so we better not disable it
  " inoremap  <Left>  <NOP>

  noremap   <Up>    <NOP>
  noremap   <Down>  <NOP>
  noremap   <Right> <NOP>

  " " jump up/down row on screen instead of line in document
  " nmap j <Left>
  " nmap k gj
  " nmap l gk

  " " jump up/down row on screen instead of line in document
  noremap j <Left>
  noremap k gj
  noremap l gk
  noremap ; l

  vnoremap j <Left>
  vnoremap k gj
  vnoremap l gk
  vnoremap ; l

  vnoremap   <Up>    <NOP>
  vnoremap   <Down>  <NOP>
  vnoremap   <Right> <NOP>

  " Move line up/down
  
  " Normal mode
  nnoremap <C-k> :m .+1<CR>==
  nnoremap <C-l> :m .-2<CR>==

  " Insert mode
  inoremap <C-k> <ESC>:m .+1<CR>==gi
  inoremap <C-l> <ESC>:m .-2<CR>==gi

  " Visual mode
  vnoremap <C-k> :m '>+1<CR>gv=gv
  vnoremap <C-l> :m '<-2<CR>gv=gv

  " ,' Surround a word with 'single quotes'
  map ,' ysiw'
  vmap ,' c'<C-R>"'<ESC>

  map ,` ysiw`
  vmap ,` c`<C-R>"`<ESC>

  map ," ysiw"
  vmap ," c`<C-R>""<ESC>
  
  " ,) or ,( Surround a word with (parens)
  " The difference is in whether a space is put in
  map ,( ysiw(
  map ,) ysiw)
  vmap ,( c( <C-R>" )<ESC>
  vmap ,) c(<C-R>")<ESC>

  " ,[ Surround a word with [brackets]
  map ,] ysiw]
  map ,[ ysiw[
  vmap ,[ c[ <C-R>" ]<ESC>
  vmap ,] c[<C-R>"]<ESC>

  " ,{ Surround a word with {braces}
  map ,} ysiw}
  map ,{ ysiw{
  vmap ,} c{ <C-R>" }<ESC>
  vmap ,{ c{<C-R>"}<ESC>
  
  map ,> ysiw>
  map ,< ysiw<
  vmap ,< c<<C-R>"><ESC>

  " replace text inside/around block elements, jump to next block if 
  " the cursor is not in one
  noremap ci) /)<cr>ci)
  noremap ci( /(<cr>ci(
  noremap ci{ /{<cr>ci{
  noremap ci} /}<cr>ci}
  noremap ci[ /[<cr>ci[
  noremap ci] /]<cr>ci]
  noremap ci[ /[<cr>ci[
  noremap ci] /]<cr>ci]
  noremap ci< /<<cr>ci<
  noremap ci> /><cr>ci>
  noremap ci" /"<cr>ci"
  noremap ci' /'<cr>ci'
  noremap ci` /{<cr>ci`

  noremap ca) /)<cr>ca)
  noremap ca( /(<cr>ca(
  noremap ca{ /{<cr>ca{
  noremap ca} /}<cr>ca}
  noremap ca[ /[<cr>ca[
  noremap ca] /]<cr>ca]
  noremap ca[ /[<cr>ca[
  noremap ca] /]<cr>ca]
  noremap ca< /<<cr>ca<
  noremap ca> /><cr>ca>
  noremap ca" /"<cr>ca"
  noremap ca' /'<cr>ca'
  noremap ca` /{<cr>ca`

  " previous/next tab
  nnoremap <leader>k :bn<cr>
  nnoremap <leader>l :bp<cr>
  nnoremap K :bn<cr>
  nnoremap L :bp<cr>


  " when deleting, yank to register e
  nnoremap d "ed
  noremap <C-p>p "ep
  vnoremap <C-p>p "ep
  noremap <C-p>P "eP
  vnoremap <C-p>P "eP

  vnoremap <C-c> "+y
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
