lua require('packer-plugins');
lua require('keymap');
lua require('theme');
lua require('settings');

source $XDG_CONFIG_HOME/nvim/pluginconfig.vim

source $XDG_CONFIG_HOME/nvim/abbr.vim
source $XDG_CONFIG_HOME/nvim/keymap.vim
source $XDG_CONFIG_HOME/nvim/bclose.vim

au CursorHold * checktime    

augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

source $XDG_CONFIG_HOME/nvim/onvimenter.vim

" run :h stdpath to find out the commands for retrieving nvim config/data
" paths
