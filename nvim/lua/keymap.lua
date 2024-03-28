vim.g.mapleader = "'"

-- no escape
vim.keymap.set('n', '<Leader>', '<nop>', {
  noremap = true,
})
vim.keymap.set('i', 'jj', '<esc><Right>', {
  noremap = true,
})
vim.keymap.set('i', '<C-c>', '<esc>u', {
  noremap = true,
})
vim.keymap.set('i', '<esc>', '<nop>', {
  noremap = true,
})

-- for the foot pedal
vim.keymap.set('i', '<C-q>', "<esc>", {
    noremap = true,
    silent = true
})

-- for the foot pedal
vim.keymap.set('n', '<C-q>', vim.cmd.quit, {
  noremap = true,
  silent = true
})

vim.keymap.set('n', 'J', 'J$')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- substitute selection with multi cursor
vim.keymap.set("x", "<leader>s", '"zy<Esc>:%s/<C-R>z//g<Left><Left>')

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    vim.keymap.set('n', 'gde', vim.diagnostic.open_float)
    vim.keymap.set('n', 'gdp', vim.diagnostic.goto_prev)
    vim.keymap.set('n', 'gdn', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'gdl', vim.diagnostic.setloclist)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('i', '<C-K>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
  end,
})

vim.keymap.set('n', 'gu', vim.cmd.UndotreeToggle)
vim.cmd [[
  if !exists('g:undotree_WindowLayout')
      let g:undotree_WindowLayout = 2
  endif
]]

