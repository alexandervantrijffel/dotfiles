source $XDG_CONFIG_HOME/nvim/setjkl.vim

let g:mapleader = "'"

" default mappings
" <C-g> show full path to current buffer
" K show type info

nnoremap <leader>a :RgFzf<cr>
nnoremap <leader>g :Rg<cr>

" add --no-heading 
" to show the file name in fzf preview, 
command!      -bang -nargs=* RgFzf call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --follow -- ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%'), <bang>0)

au FileType python nmap <A-f> :call Autopep8()<CR>

au FileType go nmap <A-f> :GoFmt<cr>:GoBuild<cr>
" au FileType go nmap <A-f> :call CocAction('runCommand', 'editor.action.organizeImport')<cr>:GoFmt<cr>:GoBuild<cr>

au FileType go nmap <leader>r :GoRename<cr>

noremap <silent><nowait> <leader>T :<C-u>CocFzfList outline<cr>
noremap <silent><nowait> <leader>t :<C-u>CocFzfList symbols<CR>
  " au FileType go nmap <leader>t :FzfTags<cr>
nnoremap <silent><leader>x :<C-u>call CocAction('jumpReferences')<CR>
nnoremap <silent><nowait> <leader>j  :call CocAction('diagnosticNext')<CR>
nnoremap <silent><nowait> <leader>k  :call CocAction('diagnosticPrevious')<CR>
noremap <silent><nowait> <leader>e :CocCommand explorer --preset floating<CR>
let g:hardtime_ignore_buffer_patterns = [ ".*coc.*" ]

" let g:autopep8_max_line_length=120
" autocmd FileType python noremap <buffer> <A-f> :call Autopep8()<CR>
" noremap <A-f> :CocCommand python.runLinting<CR>

" no esc
inoremap jj <esc>
inoremap <C-c> <esc>uu
inoremap <C-q> <esc>
inoremap  <esc> <NOP>
" for the foot pedal
noremap <C-q> :q<esc>

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

" yank to clipboard
vnoremap <C-c> "+y
" copy line to clipboard
nnoremap <C-c> "+yy
vnoremap Y "+y$

" when pasting in visual mode, do not put the visual selection in the
" clipboard; keep the clipboard as is
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

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

" fzf.vim
nnoremap <C-p> :Files<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bl :Lines<cr>

" previous/next tab
nnoremap <leader>k :bn<cr>
nnoremap <leader>l :bp<cr>
" prevent that vim-go overwrites our K mapping
let g:go_doc_keywordprg_enabled = 0
nnoremap K :bn<cr>
nnoremap L :bp<cr>

" /********* Coc **********\

" Remap keys for gotos
" nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Use sd or <A-d> to show documentation in preview window.
" (K by default)
inoremap <A-d> <Esc>:call <SID>show_documentation()<CR>
nmap <A-d> <Esc>:call <SID>show_documentation()<CR>
nmap sd :call <SID>show_documentation()<CR>

nmap <leader>rn <Plug>(coc-rename)

" vmap <leader>f <Plug>(coc-format)
" nmap <leader>f <Plug>(coc-format)

" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Resume latest coc list
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

noremap <C-l> <Plug>(copilot-next)
