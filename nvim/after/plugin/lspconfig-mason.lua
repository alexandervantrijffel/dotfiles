require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

vim.keymap.set('n', 'gde', vim.diagnostic.open_float)
vim.keymap.set('n', 'gdp', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gdn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gdl', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
  end,
})

-- https://www.reddit.com/r/neovim/comments/lwz8l7/how_to_use_tsservers_organize_imports_with_nvim/
--
-- https://stackoverflow.com/questions/67760988/neovim-0-5-organize-imports-on-save

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
  cmd = {'tsserver'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['dockerls'].setup {
  cmd = {'dockerls'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['tailwindcss'].setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['yamlls'].setup {
  cmd = {'yamlls'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['bashls'].setup {
  cmd = {'bashls'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['docker_compose_language_service'].setup {
  cmd = {'docker_compose_language_service'},
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig['golangci_lint_ls'].setup {
  cmd = {'golangci_lint_ls'},
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
  on_attach = function(client)
    -- disable formatting because we use prettier
    client.resolved_capabilities.document_formatting = false
  end,
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

