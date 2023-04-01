vim.g.mapleader = ' '

-- no escape
vim.keymap.set('n', '<Leader>', '<nop>', {
    noremap = true,
})
vim.keymap.set('i', 'jj', '<esc>', {
    noremap = true,
})
vim.keymap.set('i', '<C-c>', '<esc>u', {
    noremap = true,
})
vim.keymap.set('i', '<esc>', '<nop>', {
    noremap = true,
})
-- for the foot pedal
vim.keymap.set('n', '<C-q>', vim.cmd.quit, {
    noremap = true,
    silent = true
})

