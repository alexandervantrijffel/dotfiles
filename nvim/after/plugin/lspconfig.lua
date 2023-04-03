local on_attach = function(_, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'sh', 'zsh', 'zshrc', 'bash', 'inc', 'command', 'zsh_*' },
  settings = {
    bashIde = {
      globPattern = "**/*@(.sh|.inc|.bash|.command|.zshrc|.zsh|zsh_*)"
    }
  }
}

lspconfig.docker_compose_language_service.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

local configs = require 'lspconfig/configs'
if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod', 'go.work'),
      init_options = {
        command = { "go", "list -f '{{.Dir}}' -m | xargs golangci-lint run --issues-exit-code=1" },
      }
    },
  }
end

lspconfig.golangci_lint_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'go', 'gomod' }
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.gopls.setup {
  cmd = { 'gopls' },
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

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  function(client)
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

vim.diagnostic.config({
  underline = false,
  signs = true,
  virtual_text = {
    source = 'always',
    prefix = 'λ', -- '●',
    spacing = 12,
  },
  float = {
    header = "",
    scope = 'line',
    source = 'always',
    border = 'single',
    focusable = false,
    prefix = function(diagnostic, i, total)
      local icon, highlight
      if diagnostic.severity == 1 then
        icon = ""
        highlight = "DiagnosticSignError"
      elseif diagnostic.severity == 2 then
        icon = ""
        highlight = "DiagnosticSignWarn"
      elseif diagnostic.severity == 3 then
        icon = ""
        highlight = "DiagnosticSignInfo"
      elseif diagnostic.severity == 4 then
        icon = "λ"
        highlight = "DiagnosticSignHint"
      end
      return i .. "/" .. total .. " " .. icon .. "  ", highlight
    end,
  },
  update_in_insert = false,
  severity_sort = true,
})

vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
