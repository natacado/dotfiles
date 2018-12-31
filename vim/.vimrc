" http://vimdoc.sourceforge.net/htmldoc/syntax.html

" Highlight "bad" spaces
let c_space_errors=1

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

set colorcolumn=80

" Mouse support, including scrolling inside tmux inside mosh
" http://superuser.com/a/550482
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

if filereadable("$ADMIN_SCRIPTS/master.vimrc")
  source $ADMIN_SCRIPTS/master.vimrc
endif
