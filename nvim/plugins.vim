" Install with :PlugInstall

" Plugins are installed to $HOME/.local/share/nvim/plugged

call plug#begin()

Plug 'neovim/nvim-lspconfig'

Plug 'alexandervantrijffel/vim-material'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'antoinemadec/coc-fzf'

Plug 'easymotion/vim-easymotion'

Plug 'github/copilot.vim'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install' }

Plug '907th/vim-auto-save'

" Smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" Comment out line
Plug 'tpope/vim-commentary'

" Change color of #123456 hexcodes in text
Plug 'chrisbra/colorizer'

" Bottom status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Yet Another TypeScript Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

Plug 'flazz/vim-colorschemes'
" change working directory to project root
" Plug 'airblade/vim-rooter'

" :Far and :Far (interactive) - find and replace in multiple files
Plug 'brooth/far.vim'

" Plug 'tell-k/vim-autopep8'
" Plug 'tomlion/vim-solidity'

call plug#end()

source $XDG_CONFIG_HOME/nvim/pluginconfig.vim
