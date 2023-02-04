    "" FROM [HTTPS://GITHUB.COM/JOSHDICK/ONEDARK.VIM]
""USE 24-BIT (TRUE-COLOR) MODE IN VIM/NEOVIM WHEN OUTSIDE TMUX.
""IF YOU'RE USING TMUX VERSION 2.2 OR LATER, YOU CAN REMOVE THE OUTERMOST $TMUX CHECK AND USE TMUX'S 24-BIT COLOR SUPPORT
""(SEE < HTTP://SUNAKU.GITHUB.IO/TMUX-24BIT-COLOR.HTML#USAGE > FOR MORE INFORMATION.)
"IF (EMPTY($TMUX))
  "IF (HAS("NVIM"))
    ""FOR NEOVIM 0.1.3 AND 0.1.4 < HTTPS://GITHUB.COM/NEOVIM/NEOVIM/PULL/2198 >
    "LET $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "ENDIF
  ""FOR NEOVIM > 0.1.5 AND VIM > PATCH 7.4.1799 < HTTPS://GITHUB.COM/VIM/VIM/COMMIT/61BE73BB0F965A895BFB064EA3E55476AC175162 >
  ""BASED ON VIM PATCH 7.4.1770 (`GUICOLORS` OPTION) < HTTPS://GITHUB.COM/VIM/VIM/COMMIT/8A633E3427B47286869AA4B96F2BFC1FE65B25CD >
  "" < HTTPS://GITHUB.COM/NEOVIM/NEOVIM/WIKI/FOLLOWING-HEAD#20160511 >
  "IF (HAS("TERMGUICOLORS"))
    "SET TERMGUICOLORS
  "ENDIF
"ENDIF

    " From (https://www.chrisatmachine.com/blog/category/neovim/03-vim-themes)

" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
endif

highlight Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    highlight LineNr ctermbg=NONE guibg=NONE
endif

set background=dark
let g:airline_theme='onedark'
syntax on
colorscheme onedark

" Overwrite higlighting (default: #2C323C, #E5C07B)
highlight CursorLine      guibg=#1D2229 guifg=NONE
highlight Folded          guibg=#1D2229 guifg=#5C6370
highlight Search          guibg=#1D2229 guifg=#F77416
highlight IncSearch       guibg=NONE    guifg=#56B6C2
highlight CurSearch       guibg=NONE    guifg=#56B6C2
highlight Comment         guibg=NONE    guifg=#5C6370
