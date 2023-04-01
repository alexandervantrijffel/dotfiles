--  run compile, update, and install plugins
-- :PackerSync

-- View installed plugins
-- :PackerStatus
--

local packer = require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- :Mason
  use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
  -- :LspInfo
    'neovim/nvim-lspconfig',
      run = ':MasonUpdate'
  }

  -- :TSInstallInfo
  -- :TSUpdate
  use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
   }

  -- Yet Another TypeScript Syntax
  -- Do we need this??
  use {'HerringtonDarkholme/yats.vim'}


  use {'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons'}

  use {'alexandervantrijffel/vim-material'}

  -- also check picom.conf for opacity
  use {'xiyaowong/transparent.nvim'}

use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
 }

use {'easymotion/vim-easymotion'}

use {'github/copilot.vim'}

use {'lewis6991/gitsigns.nvim'}

use {'907th/vim-auto-save'}

-- Smooth scrolling
use {'yuttie/comfortable-motion.vim'}

-- Comment out line
use {'tpope/vim-commentary'}

-- Git wrapper
use {'tpope/vim-fugitive'}
-- :GV! view commit log of current file
-- :GV -S foobar -- src view commit log
use {'junegunn/gv.vim'}

use {'tpope/vim-surround'}

-- Change color of #986456 hexcodes in text
use {'ap/vim-css-color'}

-- Bottom status bar and top bar
use {'nvim-tree/nvim-web-devicons'}

-- https://www.webfx.com/tools/emoji-cheat-sheet/
use {'junegunn/vim-emoji'}

use {'nvim-lualine/lualine.nvim'}

-- Rainbow parentheses
use {'luochen1990/rainbow'}

use {'yuezk/vim-js'}
use {'maxmellon/vim-jsx-pretty'}

-- :Far and :Far (interactive) - find and replace in multiple files
use {'brooth/far.vim'}

-- use {'tell-k/vim-autopep8'}
-- use {'tomlion/vim-solidity'}

use {'nvim-lua/plenary.nvim'}
use {'ThePrimeagen/harpoon'}
use {'jose-elias-alvarez/null-ls.nvim'}

use {'kwkarlwang/bufjump.nvim'}

use {'neoclide/coc.nvim', branch = 'release', run ='yarn install' }

use {'antoinemadec/coc-fzf'}
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer
