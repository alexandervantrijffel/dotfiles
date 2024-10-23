local map = vim.keymap.set

vim.g.mapleader = "'"

-- no escape
map('n', '<Leader>', '<nop>', {
  noremap = true,
})
map('i', 'jj', '<esc><Right>', {
  noremap = true,
})
map('i', '<C-c>', '<esc>u', {
  noremap = true,
})
map('i', '<esc>', '<nop>', {
  noremap = true,
})

-- for the foot pedal
map('i', '<C-q>', "<esc>", {
    noremap = true,
    silent = true
})

-- for the foot pedal
map('n', '<C-q>', vim.cmd.quit, {
  noremap = true,
  silent = true
})

map('n', 'J', 'J$')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- substitute selection with multi cursor
map("x", "<leader>s", '"zy<Esc>:%s/<C-R>z//g<Left><Left>')

map('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    map('n', 'gde', vim.diagnostic.open_float)
    map('n', 'gdp', vim.diagnostic.goto_prev)
    map('n', 'gdn', vim.diagnostic.goto_next)
    map('n', 'gdl', vim.diagnostic.setloclist)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', '<leader>d', vim.lsp.buf.definition, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gk', vim.lsp.buf.hover, opts)
    map('i', '<C-K>', vim.lsp.buf.signature_help, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'gy', vim.lsp.buf.type_definition, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    -- map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- map('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
  end,
})

map('n', 'gu', vim.cmd.UndotreeToggle)

vim.cmd [[
  if !exists('g:undotree_WindowLayout')
      let g:undotree_WindowLayout = 2
  endif
]]

local function CopilotAcceptOneCharacter()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return bar:sub(1, 1)
end
local function CopilotAcceptOneWord()
  local suggestion = vim.fn['copilot#Accept']("")
  local bar = vim.fn['copilot#TextQueuedForInsertion']()
  return vim.fn.split(bar,  [[[ .]\zs]])[1]
end

map('i', '<C-l>', CopilotAcceptOneCharacter, {expr = true, remap = false})
map('i', '<C-f>', CopilotAcceptOneWord, {expr = true, remap = false})
map('n', '<leader>w', vim.cmd.write)

vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
