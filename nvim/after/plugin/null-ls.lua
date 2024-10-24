local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  -- view with :NullLsLog
  -- debug = true,

  -- find more sources at https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.formatting.fixjson,

    -- null_ls.builtins.code_actions.ltrs,     -- rust
    -- null_ls.builtins.diagnostics.ltrs,
    null_ls.builtins.formatting.rustfmt,

    null_ls.builtins.formatting.djlint.with({
      filetypes = { "html", "jinja" },
      generator_opts = {
        command = "djlint",
        args = {
            "--ignore-blocks",
            "call",
            "--blank-line-before-tag",
            "macro",
            "--blank-line-after-tag",
            "endmacro",
            "--profile",
            "jinja",
            "--reformat",
            "-",
        },
        to_stdin = true,
    },
    }),

    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.gomodifytags,

    null_ls.builtins.diagnostics.actionlint,     -- github actions workflows
    null_ls.builtins.formatting.golines,
    null_ls.builtins.diagnostics.luacheck,

    null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.formatting.remark,

    -- null_ls.builtins.diagnostics.tsc,
    -- null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.formatting.beautysh,

    null_ls.builtins.formatting.rustywind,     -- tailwindcss

    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "json", "jsonc",  "markdown", "markdown.mdx", "graphql", "handlebars" }
      -- this is disabled because it merges # comments in yaml with the previous line which sucks
      -- "yaml",
      -- this is disabled because it puts all Askama / Jijnja tags on a single lines
      -- "html",
    }),
    null_ls.builtins.diagnostics.tfsec,
    null_ls.builtins.formatting.terraform_fmt,
    -- null_ls.builtins.diagnostics.markuplint,     -- html
    --
    -- don't use https://github.com/golangci/golangci-lint/issues/2654 is solved
    -- this is replaced with a custom config for golangci-lint in lspconfig
    -- null_ls.builtins.diagnostics.golangci_lint,
    -- don't enable this; it leads to performance issues and issues with undo

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
