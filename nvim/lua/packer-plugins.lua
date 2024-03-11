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

  use("hrsh7th/nvim-cmp")
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'saadparwaiz1/cmp_luasnip',
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })

  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })

  -- :TSInstallInfo
  -- :TSUpdate
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use({
    "j-hui/fidget.nvim",
    -- remove this
    tag = 'legacy',
    config = function()
      require("fidget").setup()
    end
  })

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

  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
      }
    end,
  })

  -- Smooth scrolling
  use 'yuttie/comfortable-motion.vim'

  use 'tpope/vim-commentary'

  -- Git wrapper
  use 'tpope/vim-fugitive'

  -- :GV! view commit log of current file
  -- :GV -S foobar -- src view commit log
  use 'junegunn/gv.vim'

  use 'tpope/vim-surround'

  -- Bottom status bar and top bar
  use 'nvim-tree/nvim-web-devicons'

  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use 'jose-elias-alvarez/null-ls.nvim'

  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }

  -- use {
  -- 'windwp/nvim-autopairs',
  -- config = function() require('nvim-autopairs').setup {} end
  -- }

  -- colors for hex #ffffff #ABCDEF
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup { '*', } end

  }

  use {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              cargo = {
                features = 'all'
              }
            },
          },
        },
    }

    end
  }

  -- :WhichKey <leader>
  -- :WhichKey g
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

  -- :Far and :Far (interactive) - find and replace in multiple files
  -- use 'brooth/far.vim'

  -- show command window and messages in popup windows
  -- Commands:
  --
  -- :Noice or :Noice history shows the message history
  -- :Noice last shows the last message in a popup
  -- :Noice dismiss dismiss all visible messages
  -- :Noice errors shows the error messages in a split. Last errors on top
  -- use {
  --   'folke/noice.nvim',
  --   requires = {
  --     'MunifTanjim/nui.nvim',
  --     'rcarriga/nvim-notify',
  --   }
  -- }

  -- require("notify").setup({
  --   background_colour = "#1E2D3D",
  -- })

  -- require("noice").setup({
  --   lsp = {
  --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --     override = {
  --       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --       ["vim.lsp.util.stylize_markdown"] = true,
  --       ["cmp.entry.get_documentation"] = true,
  --     },
  --   },
  --   -- you can enable a preset for easier configuration
  --   presets = {
  --     bottom_search = true, -- use a classic bottom cmdline for search
  --     command_palette = true, -- position the cmdline and popupmenu together
  --     long_message_to_split = true, -- long messages will be sent to a split
  --     inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --     lsp_doc_border = false, -- add a border to hover docs and signature help
  --   },
  -- })
end)

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer
