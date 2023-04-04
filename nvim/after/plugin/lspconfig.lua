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

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
require("rust-tools").setup({
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
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
  },
})


vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
