local n = 'n'
local v = 'v'
local i = 'i'
local nvo = {'n', 'v', 'o'} -- map

local function map(mode, key, value)
    vim.keymap.set(mode, key, value, { remap = true, silent = false })
end

local function noremap(mode, key, value)
    vim.keymap.set(mode, key, value, { remap = false, silent = false })
end

local function resize(key, value)
    vim.keymap.set({'n', 'v', 'o', 'i'}, key, value, { remap = false, silent = true })
end

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Go to <++> pattern and change around it
    -- map(nvo, '<leader><leader>', '<CMD>keepp /<++><CR>ca<')
    -- map(i, '<leader><leader>', '<CMD>keepp /<++><CR><ESC>ca<')
    map(nvo, '<leader><leader>', '/<++><CR>ca<')
    map(i, '<leader><leader>', '<ESC>/<++><CR><ESC>ca<')

-- Copy selection to clipboard (xsel, xclip, or wl_copy and wl_paste required)
    map(v, '<C-y>', '"+y')

-- Comment is ctrl + / (vim commentary plugins require)
    -- Move down one line after comment
        map(n, '<C-_>', '<Plug>CommentaryLine j')
        map(i, '<C-_>', '<ESC><Plug>CommentaryLine j')
    -- Stay atthat line after comment (remove j after comment)
        map(v, '<C-_>', '<Plug>Commentary')

-- Keeping cursor in center for next/previous search occurence
    map(n, 'n', 'nzz')
    map(n, 'N', 'Nzz')

-- Mimic shell movements
    map(i, '<C-E>', '<C-o>$')
    map(i, '<C-A>', '<C-o>^')

-- Quickly save the current buffer or all buffers
    -- map(n, '<leader>w', '<CMD>update<CR>')
    map(n, '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
    map(n, '<C-Q>', '<CMD>q<CR>')

-- Move to the next, previous, or last buffer
    map(n, '<leader>[', '<CMD>bp<CR>')
    map(n, '<leader>]', '<CMD>bn<CR>')
    map(n, '<leader>\\', '<CMD>bn<CR>')

-- Copying the vscode behaviour of making tab splits
    map(n, '<C-\\>', '<CMD>vsplit<CR>')
    map(n, '<A-\\>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    map(nvo, '<A-j>', '<CMD>move .+1<CR>')
    map(nvo, '<A-k>', '<CMD>move .-2<CR>')

-- Perform dot commands over visual blocks:
    vim.cmd.vnoremap('. :normal .<CR>')
-- Spell-check set to <leader>o, 'o' for 'orthography'<CMD>
    map(nvo, '<leader>o', '<CMD>setlocal spell! spelllang=en_us<CR>')

-- Shortcutting split navigation, saving a keypress:
    map(nvo, '<C-h>', '<C-w>h')
    map(nvo, '<C-j>', '<C-w>j')
    map(nvo, '<C-k>', '<C-w>k')
    map(nvo, '<C-l>', '<C-w>l')

-- Make adjusting split sizes a bit more friendly:
    resize('<C-Left>', '<CMD>vertical resize +3<CR>')
    resize('<C-Right>', '<CMD>vertical resize -3<CR>')
    resize('<C-Up>', '<CMD>resize +3<CR>')
    resize('<C-Down>', '<CMD>resize -3<CR>')

-- Change 2 split windows from vertical to horizontal or vice versa
    map(nvo, '<leader>th', '<C-w>t<C-w>H')
    map(nvo, '<leader>tk', '<C-w>t<C-w>K')

-- Replace ex mode with gq
    map(nvo, 'Q', 'gq')

-- Check shell script with shellcheck:
    map(nvo, '<leader>s', '<CMD>!clear && shellcheck -x %<CR>')

-- Open my bibliography file in split
    map(nvo, '<leader>b', '<CMD>vsp<space>$BIB<CR>')
    map(nvo, '<leader>r', '<CMD>vsp<space>$REFER<CR>')

-- Replace all is aliased to S. (lua cannot do <CMD> without ending the value with <CR>)
    vim.cmd.nnoremap('S :%s//g<Left><Left>')

-- Compile document, be it groff/LaTeX/markdown/etc.
    map(nvo, '<leader>c', '<CMD>w! | !compiler "%:p"<CR>')

-- Open corresponding .pdf/.html or preview
    map(nvo, '<leader>p', '<CMD>!opout "%:p"<CR>')

-- Give execute permission on current buffer
    map(nvo, '<leader>x', '<CMD>!chmod +x %<CR>')
    -- Remove execute permission on current buffer
        map(nvo, '<leader>X', '<CMD>!chmod -x %<CR>')

-- Load command shortcuts generated from bm-dirs and bm-files via shortcuts
-- script. Here leader is ";".
-- So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
-- if typed fast without the timeout.
    vim.cmd.source('$XDG_CONFIG_HOME/nvim/shortcuts.vim')
