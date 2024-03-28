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

wk.register({
  h = {
    name = "harpoon",
    a = "Add current file to harpoon",
    m = "Harpoon menu",
    n = "Harpoon to next file",
    p = "Harpoon to previous file",
    z = "Harpoon to first file",
    x = "Harpoon to second file",
    c = "Harpoon to third file",
    v = "Harpoon to fourth file",
  },
  g = {
    D = "GoTo declaration",
    d = {
      "diagnostic",
      e = "Show diagnostics",
      l = "Show diagnostics in a panel",
      n = "GoTo next diagnostic",
      p = "GoTo previous diagnostic",
    },
    e = "easymotion GoTo end of word",
    f = "Search in files with rg",
    h = "Open file from history",
    k = "Show docs of functions and types",
    p = "Open files with fzf",
    r = "GoTo references",
    s = "easymotion GoTo character",
    t = "GoTo workspace symbols",
    T = "GoTo document symbols",
    u = ":UndoTreeToggle",
    w = "easymotion GoTo start of word",
    y = "GoTo type definition",
  },
  ["<leader>"] = {
    b = {
      name = "buffer",
      b = "Open buffer file with fzf",
      l = "Search in buffer files with rg",
      d = "Close buffer",
    },
    d = "GoTo definition",
    f = "Format code",
    s = "Substitute selection with multi-cursor",
    ca = "Code actions",
    rn = "Rename symbol",
  }
})
