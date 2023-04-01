" Remap keys for gotos
" nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> gdn  :call CocAction('diagnosticNext')<CR>
" nnoremap <silent> gdp  :call CocAction('diagnosticPrevious')<CR>
" noremap gT :<C-u>CocFzfList outline<cr>
" fails with go and coc-fzf:
" noremap gt :<C-u>CocFzfList symbols<CR>
" noremap gt :<C-u>CocList symbols<CR>

" nmap rn <Plug>(coc-rename)

" Use gk to show documentation in preview window. (K by default)
" nnoremap <silent> gk :call ShowDocumentation()<CR>

" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" Fix autofix problem of current line
" nmap <leader>qf <Plug>(coc-fix-current)

" " Show all diagnostics
" nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" " Show commands
" nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" " nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" " Resume latest coc list
" nnoremap <silent> <space>r  :<C-u>CocListResume<CR>

" suggestion menu:
" <C-n> <C-p> to navigate items
" <C-e> to close menu
" <cr> or <C-y> to confirm
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" " use <c-tab> to trigger completion and navigate to the next complete item
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<C-Tab>" :
"       \ coc#refresh()

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

"   " au FileType go nmap <leader>t :FzfTags<cr>
" noremap <silent><nowait> <leader>e :CocCommand explorer --preset floating<CR>
" let g:hardtime_ignore_buffer_patterns = [ ".*coc.*" ]

" " vmap <leader>f <Plug>(coc-format)
" " nmap <leader>f <Plug>(coc-format)
