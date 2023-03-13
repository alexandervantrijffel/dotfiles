source $XDG_CONFIG_HOME/nvim/settings.vim

source $XDG_CONFIG_HOME/nvim/plugins.vim

source $XDG_CONFIG_HOME/nvim/abbr.vim
source $XDG_CONFIG_HOME/nvim/keymap.vim
source $XDG_CONFIG_HOME/nvim/bclose.vim

colorscheme material

au CursorHold * checktime    

augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

source $XDG_CONFIG_HOME/nvim/onvimenter.vim
