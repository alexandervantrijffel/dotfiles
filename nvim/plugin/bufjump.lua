require("bufjump").setup({
    forward = "<nop>",
    backward = "g0",
    on_success = function()
        vim.cmd([[execute "normal! g`\"zz"]])
    end,
})
