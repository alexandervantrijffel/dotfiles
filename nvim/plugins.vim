" Install with :PlugInstall
" Update with :PlugUpdate
" Remove with :PlugClean
" Upgrade vim-plug with :PlugUpgrade

" Plugins are installed to $HOME/.local/share/nvim/plugged

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" for installation of LSP's. Run this command when starting with 
" new languages and file types.
" :Mason
" :MasonUpdate
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" :LspInfo
Plug 'neovim/nvim-lspconfig'

" :TSInstallInfo
" :TSUpdate
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'alexandervantrijffel/vim-material'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'antoinemadec/coc-fzf'

Plug 'easymotion/vim-easymotion'

Plug 'github/copilot.vim'

Plug 'mhinz/vim-signify'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install' }

Plug '907th/vim-auto-save'

" Smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" Comment out line
Plug 'tpope/vim-commentary'

" Change color of #986456 hexcodes in text
Plug 'ap/vim-css-color'

" Bottom status bar and top bar
Plug 'nvim-tree/nvim-web-devicons'

" https://www.webfx.com/tools/emoji-cheat-sheet/
Plug 'junegunn/vim-emoji'

Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lualine/lualine.nvim'

" Plug 'romgrk/barbar.nvim'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Yet Another TypeScript Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" change working directory to project root
" Plug 'airblade/vim-rooter'

" :Far and :Far (interactive) - find and replace in multiple files
Plug 'brooth/far.vim'


" Plug 'tell-k/vim-autopep8'
" Plug 'tomlion/vim-solidity'

call plug#end()

source $XDG_CONFIG_HOME/nvim/pluginconfig.vim
