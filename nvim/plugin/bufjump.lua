require("bufjump").setup({
    forward = "<nop>",
    backward = "<C-n>",
    on_success = function()
        vim.cmd([[execute "normal! g`\"zz"]])
    end,
})
