vim.o.number = true
vim.o.relativenumber = true
vim.cmd [[
  " set absolute numbers in insert mode
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END
]]

-- yank to system clipboard
vim.opt.clipboard:append('unnamed')
vim.opt.clipboard:append('unnamedplus')

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')
vim.opt.completeopt:append('noselect')
vim.opt.jumpoptions:append('stack')

-- keep n lines below and above the cursor
vim.o.scroll = 6
vim.o.scrolloff = 6
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.errorbells = false
vim.o.autochdir = false
vim.o.swapfile = false
vim.o.smarttab = false
vim.o.list = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.splitright = true
vim.o.cmdheight = 1
-- merge signcolumn and number column into one
vim.wo.signcolumn = 'yes'
vim.o.colorcolumn = '80'
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 100

vim.o.cursorline = true
vim.o.hlsearch = true
-- highlight search results
vim.o.incsearch = true
-- live update of substitution
vim.o.inccommand = 'nosplit'
vim.cmd [[
  " when entering insert mode, disable search highlighting once
  augroup diablehlsearchoninsert
    autocmd!
    autocmd! InsertEnter * call feedkeys("\<Cmd>noh\<cr>" , 'n')
  augroup END
]]

vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.hidden = true
vim.o.undodir= os.getenv('XDG_DATA_HOME') .. '/nvim/undo'
vim.o.undolevels = 10000
vim.o.undoreload = 10000

-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- prevent arbitrary code execution https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
vim.o.modeline = false
vim.opt.isfname:append('@-@')


vim.cmd [[silent! colorscheme material]]
vim.o.termguicolors = true

vim.cmd [[hi Normal ctermfg=none ctermbg=none guibg=none]]
vim.cmd [[hi Search guibg=#82AAFF guifg=#1B222E gui=NONE ]]
vim.cmd [[hi DiagnosticFloatingError guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingWarn guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingInformation guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingHint guifg=#EEFFFF guibg=none]]

-- disable mouse
vim.opt.mouse = ""
