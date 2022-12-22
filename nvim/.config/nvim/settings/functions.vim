" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" Function for cycling themes (onedark, dracula):
let s:theme = 0
function! CycleThemes()
    if s:theme == 0
        if filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/themes/onedark.vim"'))
            source "$XDG_CONFIG_HOME/nvim/themes/onedark.vim"
        endif
        let s:theme = 1
    elseif s:theme == 1
        if filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/themes/dracula.vim"'))
            source "$XDG_CONFIG_HOME/nvim/themes/dracula.vim"
        endif
        let s:theme = 0
    endif
endfunction
nnoremap <leader>t :call CycleThemes()<CR>
