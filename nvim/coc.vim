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

source $XDG_CONFIG_HOME/nvim/cockeymap.vim

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']


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

