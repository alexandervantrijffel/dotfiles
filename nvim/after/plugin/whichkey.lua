local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,    -- shows a list of your marks on ' and `
    -- custommarks = true,
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true,    -- adds help for operators like d, y, ...
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
}

wk.add({
  { "<leader>b", group = "buffer" },
   -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
 { "<leader>bb", desc = "Open buffer file with fzf" },
 { "<leader>bl", desc = "Search in buffer files with rg" },
 { "<leader>bd", desc = "Close buffer" },
 { "<leader>d", desc = "GoTo definition" },
 { "<leader>f", desc = "Format code" },
 { "<leader>s", desc = "Substitute selection with multi-cursor" },
 { "<leader>ca", desc = "Code actions" },
 { "<leader>rn", desc = "Rename symbol" },
 { "<leader>h", group = "harpoon" },
 { "<leader>ha", desc = "Add current file to harpoon" },
 { "<leader>hm", desc = "Harpoon menu" },
 { "<leader>hn", desc = "Harpoon to next file" },
 { "<leader>hp", desc = "Harpoon to previous file" },
 { "<leader>hz", desc = "Harpoon to first file" },
 { "<leader>hx", desc = "Harpoon to second file" },
 { "<leader>hc", desc = "Harpoon to third file" },
 { "<leader>hv", desc = "Harpoon to fourth file" },
 { "gD", desc = "GoTo declaration" },
 { "gd", group = "diagnostic" },
 { "gde", desc = "Show diagnostics" },
 { "gdl", desc = "Show diagnostics in a panel" },
 { "gdn", desc = "GoTo next diagnostic" },
 { "gdp", desc = "GoTo previous diagnostic" },
 { "ge", desc = "easymotion GoTo end of word" },
 { "gf", desc = "Search in files with rg" },
 { "gh", desc = "Open file from history" },
 { "gg", group = "git" },
 { "gl", "<Cmd>G log<CR>", desc = "", mode="n" },
 { "g0l", "<Cmd>0GlLog<CR>", desc = "", mode="n" },
 { "gk", desc = "Show docs of functions and types" },
 { "gp", desc = "Open files with fzf" },
 { "gr", desc = "GoTo references" },
 { "gs", desc = "easymotion GoTo character" },
 { "gt", desc = "GoTo workspace symbols" },
 { "gT", desc = "GoTo document symbols" },
 { "gu", desc = ":UndoTreeToggle" },
 { "gw", desc = "easymotion GoTo start of word" },
 { "gy", desc = "GoTo type definition" }
})
