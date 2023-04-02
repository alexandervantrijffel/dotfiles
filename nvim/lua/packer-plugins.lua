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

  use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'nvim-tree/nvim-web-devicons' }

  use { 'alexandervantrijffel/vim-material' }

  -- also check picom.conf for opacity
  use { 'xiyaowong/transparent.nvim' }

  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }

  use { 'easymotion/vim-easymotion' }

  use { 'github/copilot.vim' }

  use { 'lewis6991/gitsigns.nvim' }

  use { '907th/vim-auto-save' }

  -- Smooth scrolling
  use { 'yuttie/comfortable-motion.vim' }

  -- Comment out line
  use { 'tpope/vim-commentary' }

  -- Git wrapper
  use { 'tpope/vim-fugitive' }
  -- :GV! view commit log of current file
  -- :GV -S foobar -- src view commit log
  use { 'junegunn/gv.vim' }

  use { 'tpope/vim-surround' }

  -- Change color of #986456 hexcodes in text
  use { 'ap/vim-css-color' }

  -- Bottom status bar and top bar
  use { 'nvim-tree/nvim-web-devicons' }

  -- https://www.webfx.com/tools/emoji-cheat-sheet/
  use { 'junegunn/vim-emoji' }

  use { 'nvim-lualine/lualine.nvim' }

  -- Rainbow parentheses
  use { 'luochen1990/rainbow' }

  use { 'yuezk/vim-js' }
  use { 'maxmellon/vim-jsx-pretty' }

  -- :Far and :Far (interactive) - find and replace in multiple files
  use { 'brooth/far.vim' }

  use { 'nvim-lua/plenary.nvim' }
  use { 'ThePrimeagen/harpoon' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  use { 'hrsh7th/nvim-cmp',
    requires = { { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' }, { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' } }
  }

  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer
