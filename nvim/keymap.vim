source $XDG_CONFIG_HOME/nvim/setjkl.vim

" default mappings
" <C-g> show full path to current buffer
" K show type info

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
" nnoremap x "ex
" nnoremap X "eX

" fzf.vim
" nnoremap <C-p> :Files<cr>
nnoremap gp :Files<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>bl :Lines<cr>

" akinsho/bufferline.nvim
nnoremap <silent> <leader><leader>t    <Cmd>BufferLinePick<CR>
nnoremap <silent> <leader><leader>o <Cmd>BufferLineSortByDirectory<CR>

" next/previous tab
nnoremap K :bn<cr>
nnoremap L :bp<cr>

" copilot-next: <C-[>
" copilot-prev: <C-[>
imap <C-n> <Plug>(copilot-next)
imap <silent><script><expr> <C-e> copilot#Accept("\<CR>")

" <C-/> to toggle preview window
nnoremap gf :RG<cr>
nnoremap gh :History<cr>

nnoremap <nowait> > V>g
nnoremap <nowait> < V<g
vmap > >gv
vmap < <gv

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nnoremap gw <Plug>(easymotion-overwin-w)
nnoremap ge <Plug>(easymotion-bd-e)
nnoremap gs <Plug>(easymotion-overwin-f)

" " ,' Surround a word with 'single quotes'
" map ,' ysiw'
" vmap ,' c'<C-R>"'<ESC>

" map ,` ysiw`
" vmap ,` c`<C-R>"`<ESC>

" map ," ysiw"
" vmap ," c`<C-R>""<ESC>

" " ,) or ,( Surround a word with (parens)
" " The difference is in whether a space is put in
" map ,( ysiw(
" map ,) ysiw)
" vmap ,( c( <C-R>" )<ESC>
" vmap ,) c(<C-R>")<ESC>

" " ,[ Surround a word with [brackets]
" map ,] ysiw]
" map ,[ ysiw[
" vmap ,[ c[ <C-R>" ]<ESC>
" vmap ,] c[<C-R>"]<ESC>

" " ,{ Surround a word with {braces}
" map ,} ysiw}
" map ,{ ysiw{
" vmap ,} c{ <C-R>" }<ESC>
" vmap ,{ c{<C-R>"}<ESC>

" map ,> ysiw>
" map ,< ysiw<
" vmap ,< c<<C-R>"><ESC>
