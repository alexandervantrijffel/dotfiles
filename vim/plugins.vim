" based on dein.vim plugin manager
" Update with :DeinUpdate or :SPUpdate
" update / install others with :UpdateRemotePlugins
"
let g:spacevim_custom_plugins = [
          \ ['907th/vim-auto-save', {'merged' : 0}],
          \ ['mileszs/ack.vim', {'merged' : 0}],
          \ ['airblade/vim-gitgutter.git', {'merged' : 0}],
          \ ['tpope/vim-fugitive', {'merged' : 0}],
          \ ['tpope/vim-commentary', {'merged' : 0}],
          \ ['chrisbra/Colorizer', {'merged' : 0}],
          \ ['yuttie/comfortable-motion.vim', {'merged' : 0}],
          \ ['HerringtonDarkholme/yats.vim', {'merged' : 0}], 
          \ ['miyakogi/conoline.vim', {'merged' : 0}],
          \ ['neoclide/coc.nvim', {'merged' : 0}],
          \ ['antoinemadec/coc-fzf', {'merged' : 0}],
          \ ['junegunn/fzf.vim', {'merged' : 0}],
          \ ['brooth/far.vim', {'merged' : 0}],
          \ ['airblade/vim-rooter', {'merged' : 0}],
          \ ['yuezk/vim-js', {'merged' : 0}],
          \ ['maxmellon/vim-jsx-pretty', {'merged' : 0}],
          \ ]


" \ ['nathanaelkane/vim-indent-guides', {'merged' : 0}],
" let g:indent_guides_enable_on_vim_startup = 1
"
" yats: typescript syntax
" far: search and replace
" vim-js && vim-jsx-pretty: required for commenting jsx/tsx
"
" no need for this one with vim-rooter
    " jump to dir of current file
    " set autochdir&
    " set autochdir!

  let g:spacevim_disabled_plugins = ['deoplete.nvim', 'deoplete-dictionary', 'deoplete-go', 'deoplete-ternjs', 'gruvbox', 'onedark.vim', 'neomake', 'neoinclude.vim',  'neomru.vim', 'neopairs.vim',  'nord-vim', 'molokai', 'open-browser.vim', 'echodoc.vim', 'neoinclude.vim',  'neomru.vim', 'neopairs.vim',  'nord-vim', 'molokai', 'open-browser.vim', 'echodoc.vim', 'NeoSolarized', 'conoline.vim', 'deol.nvim', 'editorconfig-vim', 'jellybeans.vim', 'neco-syntax', 'palenight.vim', 'vim-grepper',  'vim-snippets', 'tern_for_vim', 'srcery-vim', 'vim-flow', 'tabular', 'tagbar', 'tagbar-makefile.vim', 'tagbar-proto.vim', 'wildfire.vim', 'vim-table-mode', 'vim-emoji', 'vim-hybrid', 'vimshell.vim', 'vim-expand-region', 'vim-textobj-entire', 'vim-textobj-indent', 'vim-textobj-line', 'vim-textobj-user', 'splitjoin.vim',  'vim-mundo', 'vim-import-js', 'delimitmate', 'vim-smoothie', 'vim-matchup', 'vim-one', 'vim-sleuth', 'typescript-vim', 'vim-choosewin', 'vim-jsdoc', 'vim-easyoperator-line', 'indent-blankline.nvim']
