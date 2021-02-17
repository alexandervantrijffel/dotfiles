  nmap <leader>a :Ack

  au FileType javascript nmap <A-f> :ALEFix<cr>

  " Run this for go:
  " go get -u github.com/sourcegraph/go-langserver
  au FileType go nmap <F12> :GoReferrers<cr>
  au FileType go nmap <A-f> :GoFmt<cr>:GoBuild<cr>

  au FileType go nmap <leader>r :GoRename<cr>
  noremap <silent><nowait> <leader>T :<C-u>CocFzfList outline<cr>
  noremap <silent><nowait> <leader>t :<C-u>CocFzfList symbols<CR>
    " au FileType go nmap <leader>t :FzfTags<cr>
  nnoremap <silent><leader>x :<C-u>call CocAction('jumpReferences')<CR>
  nnoremap <silent><nowait> <leader>j  :call CocAction('diagnosticNext')<CR>
  nnoremap <silent><nowait> <leader>k  :call CocAction('diagnosticPrevious')<CR>
  noremap <silent><nowait> <leader>e :CocCommand explorer --preset floating<CR>
  let g:hardtime_ignore_buffer_patterns = [ ".*coc.*" ]

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
  noremap qq :q<esc>
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

  " yank to clipboard
  vnoremap <C-c> "+y
  " copy line to clipboard
  nnoremap <C-c> "+yy
  vnoremap yy "+yy
  noremap yy "+yy
  vnoremap Y "+y$

  " when changing text, do not yank to clipboard but to register e
  nnoremap cw "ecw
  nnoremap cW "ecW
  nnoremap ce "ece
  nnoremap cE "ecE
  nnoremap c$ "ec$
  nnoremap ct "ect
  nnoremap cf "ecf
  nnoremap C "eC

  " when deleting, yank to register e
  " nnoremap d "ed
  " when deleting, yank to register e
  noremap x "ex
  nmap <C-p>p "ep
  nmap <C-p>P "eP

  nmap <C-p> :FZF<CR>

