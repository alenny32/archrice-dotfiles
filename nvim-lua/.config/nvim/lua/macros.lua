-- This is a neovim config for defining macros

local n = 'n'
local v = 'v'
local i = 'i'
local nvo = {'n', 'v', 'o'} -- map

local function map(mode, key, value)
    vim.keymap.set(mode, key, value, { remap = true, silent = true })
end

local function noremap(mode, key, value)
    vim.keymap.set(mode, key, value, { remap = false, silent = true })
end

-- LaTeX:
    -- Compile
        map(nvo, '<F2>', '<CMD>w<CR> <CMD>!pdflatex %<CR><CR>')
    -- Add section
        map(nvo, '<leader>.a', 'i\\section{}\n\n<++><ESC>kk$i')
        map(i, '<leader>.a', '\\section{}\n\n<++><ESC>kk$i')
    -- Add subsection
        map(nvo, '<leader>.A', 'i\\subsection{}\n\n<++><ESC>kk$i')
        map(i, '<leader>.A', '\\subsection{}\n\n<++><ESC>kk$i')
    -- Insert table environment
        map(nvo, '<leader>.t', 'i\\begin{table}[htbp]\n\\caption{<++>}\n\\centering\n\\begin{tabular}{|c|c|}\n<++>\n\\end{tabular}\n\\label{tab:<++>}\n\\end{table}%<ESC>{j^')
        map(i, '<leader>.t', '\\begin{table}[htbp]\n\\caption{<++>}\n\\centering\n\\begin{tabular}{|c|c|}\n<++>\n\\end{tabular}\n\\label{tab:<++>}\n\\end{table}%<ESC>{j^')
    -- -- Insert \hline
    --     -- below current line
    --         map(nvo, '<leader>.h', 'o\\hline<ESC>')
    --         map(i, '<leader>.h', '<ESC>o\\hline<ESC>')
    --     -- above current line
    --         map(nvo, '<leader>.H', 'O\\hline<ESC>')
    --         map(i, '<leader>.H', '<ESC>O\\hline<ESC>')
    -- Insert figure environment
        map(nvo, '<leader>.f', 'i\\begin{figure}[htbp]\n\\centering\n<++>\n\\caption{<++>}\n\\label{fig:<++>}\n\\end{figure}%<ESC>{j^')
        map(i, '<leader>.f', '\\begin{figure}[htbp]\n\\centering\n<++>\n\\caption{<++>}\n\\label{fig:<++>}\n\\end{figure}%<ESC>{j^')
