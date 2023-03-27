source $XDG_CONFIG_HOME/nvim/coc.vim
source $XDG_CONFIG_HOME/nvim/go.vim
source $XDG_CONFIG_HOME/nvim/typescript.vim

let g:fzf_layout = { 'window': { 'width': 0.96, 'height': 0.96 } }

" jump to existing window if possible
let g:fzf_buffers_jump = 1

function RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -C=0 --follow -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'right,50%', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" autocomplete
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.ts"

" Override default ignore pattern in file tree to still
" show other . files
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store\)$'

let g:rg_highlight = 'true'
let g:rg_command = 'rg --vimgrep --hidden --smart-case --follow'

" the preview window of fzf uses bat so we have to configure bat theme here
let $BAT_THEME='Visual Studio Dark+'

let g:rainbow_active = 1

" useful: vim-jplus (join lines)
" 'neosnippet-snippets', 'neosnippet.vim', 'neoyank.vim',
" Required to prevent format error with coc neoformat

" run 'yarn global add standard prettier-standard babel-eslint eslint@latest eslint-plugin-prettier eslint-plugin-react eslint-config-standard eslint-plugin-import eslint-plugin-standard eslint-plugin-react@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest neovim'

" run `yarn global add import-js` for vim-import-js 
"
"
" coc-tsserver has a dependency on github.com/facebook/watchman for updating
" imports on renamed files

" run 'pip3 install pynvim' for vim
"
" run :UpdateRemotePlugins for tssserver
"
