require("bufjump").setup({
    forward = "<nop>",
    backward = "<C-o>",
    on_success = function()
        vim.cmd([[execute "normal! g`\"zz"]])
    end,
})
