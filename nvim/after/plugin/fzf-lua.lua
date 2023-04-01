vim.api.nvim_set_keymap('n', 'gt',
    "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gT',
    "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>",
    { noremap = true, silent = true })

require("fzf-lua").setup({ "fzf-native" })
