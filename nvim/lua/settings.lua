vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.number = true
vim.o.relativenumber = true
-- keep n lines below and above the cursor
vim.o.scroll = 5
vim.o.smartindent = true
vim.o.errorbells = false
vim.o.autochdir = false
vim.o.swapfile = false
vim.o.smarttab = false
vim.o.list = false
-- prevent arbitrary code execution https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
vim.o.modeline = false
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.splitright = true
vim.o.hlsearch = true
vim.o.cmdheight = 1
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 500
-- highlight search results
vim.o.incsearch = true
vim.o.backup = false
vim.o.writebackup = false
-- merge signcolumn and number column into one
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true

vim.cmd [[silent! colorscheme material]]

vim.cmd [[hi Normal ctermfg=none ctermbg=none guibg=none]]
vim.cmd [[hi DiagnosticFloatingError guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingWarn guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingInformation guifg=#EEFFFF guibg=none]]
vim.cmd [[hi DiagnosticFloatingHint guifg=#EEFFFF guibg=none]]
