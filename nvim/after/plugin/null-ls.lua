local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  -- find more sources at https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    sources = {

        null_ls.builtins.diagnostics.eslint_d.with({
              diagnostics_format = '[eslint] #{m}\n(#{c})'
            }),
        -- null_ls.builtins.formatting.eslint_d 
        null_ls.builtins.formatting.prettierd,
        -- don't enable this; it leads to performance issues and issues with undo
        -- null_ls.builtins.diagnostics.tsc,

        null_ls.builtins.code_actions.ltrs, -- rust
        null_ls.builtins.diagnostics.ltrs,
        null_ls.builtins.formatting.rustfmt,

        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.diagnostics.actionlint, -- github actions workflows

        null_ls.builtins.formatting.golines,
        null_ls.builtins.code_actions.gomodifytags,
        -- don't use https://github.com/golangci/golangci-lint/issues/2654 is solved
        -- this is replaced with a custom config for golangci-lint in lspconfig
        -- null_ls.builtins.diagnostics.golangci_lint,

        null_ls.builtins.diagnostics.luacheck,

        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.remark,

        null_ls.builtins.diagnostics.markuplint, -- html
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.formatting.beautysh,

        null_ls.builtins.formatting.rustywind, -- tailwindcss
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
