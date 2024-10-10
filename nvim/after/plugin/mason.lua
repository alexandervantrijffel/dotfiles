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
