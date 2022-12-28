-- Installing vim plugins using vim-plug
local Plug = vim.fn['plug#']

vim.cmd([[
    if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
    endif
]])

vim.cmd([[ call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"')) ]])
    Plug('tpope/vim-surround')
    Plug('preservim/nerdtree')
    Plug('junegunn/goyo.vim')
    Plug('jreybert/vimagit')
    Plug('vimwiki/vimwiki')
    Plug('vim-airline/vim-airline')
    Plug('tpope/vim-commentary')
    Plug('ap/vim-css-color')
    Plug('sheerun/vim-polyglot')
    Plug('lervag/vimtex')

    -- Theming
    Plug('joshdick/onedark.vim')
    Plug('dracula/vim', { ['as'] = 'dracula' })
    Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
vim.cmd([[ call plug#end() ]])

-- Plugins(configuration)
local nvo = {'n', 'v', 'o'}
local function map(mode, key, value)
    vim.keymap.set(mode, key, value, { remap = true, silent = false })
end

-- Goyo plugin makes text more readable when writing prose:
    map(nvo, '<leader>f', '<CMD>Goyo | set bg=light | set linebreak<CR>')

-- Enable Goyo by default for mutt writing
vim.cmd([[
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo|q!<CR>
]])

-- Nerd tree
    map(nvo, '<leader>n', '<CMD>NERDTreeToggle<CR>')
    vim.cmd('autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif')
    vim.cmd([[
        if has('nvim')
            let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
        else
            let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
        endif
    ]])

-- vimling:
    map(nvo, '<leader>d', '<CMD>call ToggleDeadKeys()<CR>')
    map('i', '<leader>d <ESC>', '<CMD>call ToggleDeadKeys()<CR>a')
    map(nvo, '<leader>i', '<CMD>call ToggleIPA()<CR>')
    map('i', '<leader>i <ESC>', '<CMD>call ToggleIPA()<CR>a')
    map (nvo, '<leader>q', '<CMD>call ToggleProse()<CR>')
