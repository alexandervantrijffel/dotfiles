local _get_darken = false
function _G.toggle_background_transparent()
  if (not _get_darken) then
    vim.cmd("hi Normal guibg=#1F2734")
    _get_darken = true
  else
    vim.cmd("hi Normal guibg=NONE")
    _get_darken = false
  end
end
