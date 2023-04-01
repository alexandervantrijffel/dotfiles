-- TIP: If you want custom color of colorcolumn local to window
-- do
--     local ns = vim.api.nvim_create_namespace('gitcommit')
--     vim.api.nvim_set_hl(ns, 'ColorColumn', { link = '#ff0000' })
--     vim.api.nvim_win_set_hl_ns(0, ns)
-- end
vim.bo.textwidth = 72
vim.wo.colorcolumn = '+0'
