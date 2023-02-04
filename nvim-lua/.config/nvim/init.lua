-- Lua modules:
require("general")          -- General Settings
require("mappings")         -- Keymaps
require("commands")         -- Colourscheme and other highlights
require("functions")        -- function definitions
require("macros")           -- Macro definitions

if vim.g.vscode then
    vim.cmd("map <A-j> <Nop>")
    vim.cmd("imap <A-j> <Nop>")
    vim.cmd("map <A-k> <Nop>")
    vim.cmd("imap <A-k> <Nop>")
else
    require("plugins")      -- Vim-Plug auto installer
    CycleThemes()
end
