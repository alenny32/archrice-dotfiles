require("general")          -- General Settings
require("mappings")         -- Keymaps
require("commands")         -- Colourscheme and other highlights
require("functions")        -- function definitions
require("macros")           -- Macro definitions
if not vim.g.vscode then
    require("plugins")          -- Vim-Plug auto installer
    CycleThemes()
end
