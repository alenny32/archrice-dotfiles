" from onedark.vim
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#BFBFBF", "cterm": "145", "cterm16" : "7" }
    " `bg` will not be styled since there is no `bg` setting
    " autocmd ColorScheme * call dracula#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

hi Comment cterm=italic
let g:dracula_hide_endofbuffer=1
let g:dracula_terminal_italics=1
let g:dracula_termcolors=1

if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif


set background=dark
let g:airline_theme='dracula'
syntax on
colorscheme dracula
