local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "ha", mark.add_file)
vim.keymap.set("n", "hm", ui.toggle_quick_menu)
