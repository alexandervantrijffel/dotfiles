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

  use { 'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
      { 'saadparwaiz1/cmp_luasnip'},
    }
  }

  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })

  -- :TSInstallInfo
  -- :TSUpdate
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }

  use 'alexandervantrijffel/vim-material'

  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = ':call fzf#install()'
    }
  }

  use 'easymotion/vim-easymotion'

  use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'

  use 'Pocco81/auto-save.nvim'

  -- Smooth scrolling
  use 'yuttie/comfortable-motion.vim'

  -- Comment out line
  use 'tpope/vim-commentary'

  -- Git wrapper
  use 'tpope/vim-fugitive'

  -- :GV! view commit log of current file
  -- :GV -S foobar -- src view commit log
  use 'junegunn/gv.vim'

  use 'tpope/vim-surround'

  -- Bottom status bar and top bar
  use 'nvim-tree/nvim-web-devicons'

  use  {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- Rainbow parentheses
  use 'luochen1990/rainbow'

  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use 'jose-elias-alvarez/null-ls.nvim'

  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons'}
  }

  use { 'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- colors for hex #ffffff #ABCDEF
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup {'*'; } end

  }

  -- :Far and :Far (interactive) - find and replace in multiple files
  -- use 'brooth/far.vim'

end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer
