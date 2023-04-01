" replaced with lsp
" let g:coc_global_extensions = [
"   \ 'coc-actions',
"   \ 'coc-intelephense
"   \ 'coc-json',
"   \ 'coc-prettier', 
"   \ 'coc-pyright',
"   \ 'coc-phpls', 
"   \ 'coc-css',
"   \ 'coc-go',
"   \ 'coc-diagnostic',
"   \ 'coc-eslint',
"   \ 'coc-yaml',
"   \ 'coc-tsserver',
"   \ ]

" let g:coc_global_extensions = [
"   \ 'coc-actions',
"   \ 'coc-intelephense
"   \ 'coc-json',
"   \ 'coc-prettier', 
"   \ 'coc-pyright',
"   \ 'coc-phpls', 
"   \ 'coc-css',
"   \ 'coc-go',
"   \ 'coc-diagnostic',
"   \ 'coc-eslint',
"   \ 'coc-yaml',
"   \ 'coc-tsserver',
"   \ ]

source $XDG_CONFIG_HOME/nvim/cockeymap.vim

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json', 'go.work']

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

