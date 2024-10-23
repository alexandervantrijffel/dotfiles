local servers = {
  "bashls",
  "gopls",
  "lua_ls",
  "rust_analyzer",
  "ts_ls",
}

require("mason").setup(
)
require("mason-lspconfig").setup {
  -- automatically install language servers setup below for lspconfig
  automatic_installation = true,
  ensure_installed = servers,
}
-- leave the setup of rust_analyzer to rustaceanvim
require('mason-lspconfig').setup_handlers {
  ['rust_analyzer'] = function() end,
}
