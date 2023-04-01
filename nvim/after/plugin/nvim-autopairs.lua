local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

-- add ( when functions are selected in nvim-cmp
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
