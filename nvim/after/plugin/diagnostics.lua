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

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('DiagnosticConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

 -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })
  end,
})
