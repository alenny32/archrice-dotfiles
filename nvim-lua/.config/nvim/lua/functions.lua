local o = vim.o

-- Function for toggling the bottom statusbar:
local HiddenAll = 0
function ToggleHiddenAll()
    if hidden_all == 0 then
        hidden_all = 1
        o.showmode = false
        o.ruler = false
        o.laststatus = 0
        o.showcmd = false
    else
        hidden_all = 0
        o.showmode = true
        o.ruler = true
        o.laststatus = 2
        o.showcmd = true
    end
end
vim.keymap.set({'n', 'v', 'o'}, '<leader>h', ToggleHiddenAll)

-- Function for cycling themes (onedark, dracula):
local theme = 0
function CycleThemes()
    if theme == 0 then
        vim.o.background = 'light'
        vim.cmd('source $XDG_CONFIG_HOME/nvim/themes/onedark.vim')
        theme = 1
    elseif theme == 1 then
        vim.o.background = 'dark'
        vim.cmd('source $XDG_CONFIG_HOME/nvim/themes/dracula.vim')
        theme = 0
    end
end
vim.keymap.set({'n', 'v', 'o'}, '<leader>t', CycleThemes)
