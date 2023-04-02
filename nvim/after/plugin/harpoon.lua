local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "ha", mark.add_file)
vim.keymap.set("n", "hm", ui.toggle_quick_menu)

vim.keymap.set("n", "hz", function() ui.nav_file(1) end)
vim.keymap.set("n", "hx", function() ui.nav_file(2) end)
vim.keymap.set("n", "hc", function() ui.nav_file(3) end)
vim.keymap.set("n", "hv", function() ui.nav_file(4) end)
