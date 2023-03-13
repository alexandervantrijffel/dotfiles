"   re-enable this when needed
"   \ 'coc-pyright',
"  coc-intelephense
" \ 'coc-phpls', 
"

" graphql_dependency_manual_install: yarn add global graphql-language-service-cli

let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-go',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-prettier', 
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ ]

source $XDG_CONFIG_HOME/nvim/coc-keymap.vim

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Customize colors of coc popup menus
func! s:my_colors_setup() abort
    hi Pmenu guibg=#44475a gui=NONE
    hi PmenuSel guibg=#44475a gui=NONE
    hi PmenuSbar guibg=#44475a
    hi PmenuThumb guibg=#44475a
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: There's always complete item selected by default, you may want to enable
" " no select by `"suggest.noselect": true` in your configuration file.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <A-l>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

