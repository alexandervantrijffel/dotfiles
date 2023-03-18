require("mason").setup()
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true
}

local nvim_lsp = require('lspconfig')
nvim_lsp.bashls.setup{}
nvim_lsp.docker_compose_language_service.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.tailwindcss.setup{}
nvim_lsp.yamlls.setup{}
