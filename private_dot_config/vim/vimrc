" http://vimdoc.sourceforge.net/htmldoc/syntax.html

" Highlight "bad" spaces
let c_space_errors=1

" Comments in italics
hi Comment cterm=italic

" Also highlight empty lines at EOF.
match ErrorMsg /\s\+$\| \+\ze\t/

" Highlight appearance for active line/column
hi CursorLine   cterm=NONE ctermbg=234 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorline

" Enable incremental search.
set incsearch

" Highlight search results
set hlsearch

" Use vertical bar in insert mode, block in normal mode
if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
  " iTerm2 custom escape codes - not needed in favor of DECSCUSR standard
  "let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
  "let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
endif

set colorcolumn=80

" Mouse support, including scrolling inside tmux inside mosh
" http://superuser.com/a/550482
set mouse+=a
if &term =~ '^screen' || &term =~ '^tmux'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

if filereadable("$ADMIN_SCRIPTS/master.vimrc")
  source $ADMIN_SCRIPTS/master.vimrc
endif
