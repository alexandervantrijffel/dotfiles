let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-go',
  \ 'coc-json',
  \ 'coc-phpls', 
  \ 'coc-prettier', 
  \ 'coc-highlight',
  \ 'coc-actions',
  \ 'coc-tsserver',
  \ 'coc-tabnine',
  \ ]

" type TabNine::config_dir in vim to view the config dir of tabnine 
" coc-settings config is at
" $HOME/.config/nvim/coc-settings.json

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
