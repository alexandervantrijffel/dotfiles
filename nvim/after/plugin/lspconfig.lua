
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  vim.keymap.set('n', 'gde', vim.diagnostic.open_float)
  vim.keymap.set('n', 'gdp', vim.diagnostic.goto_prev)
  vim.keymap.set('n', 'gdn', vim.diagnostic.goto_next)
  vim.keymap.set('n', 'gdl', vim.diagnostic.setloclist)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
  end,
})

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['dockerls'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['tailwindcss'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['yamlls'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['bashls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'sh', 'zsh', 'zshrc', 'bash', 'inc', 'command', 'zsh_*' },
  settings = {
    bashIde = {
      globPattern = "**/*@(.sh|.inc|.bash|.command|.zshrc|.zsh|zsh_*)"
    }
  }
}

lspconfig['docker_compose_language_service'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['golangci_lint_ls'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- function(client)
  --   -- disable formatting because we use prettier
  --   client.resolved_capabilities.document_formatting = false
  -- end,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

-- setup completion for rust https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}


vim.diagnostic.config({
  float = {
    source = 'always',
    border = border
  },
  underline = true,
  signs = true,
  virtual_text = true,
  float = {
      show_header = true,
      source = 'if_many',
      border = 'rounded',
      focusable = false,
  },
  update_in_insert = false, -- default to false
  severity_sort = false, -- default to false
})
