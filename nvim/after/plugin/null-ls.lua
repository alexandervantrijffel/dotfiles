local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  -- find more sources at https://github.com/nvim-lua/plenary.nvim
    sources = {
         -- null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.eslint_d.with({
              diagnostics_format = '[eslint] #{m}\n(#{c})'
            }),
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.completion.spell,
    },

    -- format on save
     on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

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
