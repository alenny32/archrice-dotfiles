-- General vim settings

local g = vim.g
local o = vim.o

-- Background and colors:
    o.termguicolors = true
    o.background = 'dark'

-- Save when switching buffers:
    o.hidden = true

-- Decrease update time
    o.timeoutlen = 1000
    o.updatetime = 200

-- Number of screen lines to keep above and below the cursor:
    o.scrolloff = 8

-- Some basics:
    vim.keymap.set('n', 'c', '"_c')
    o.compatible = false
    vim.cmd.syntax('on')
    vim.cmd.filetype('plugin indent on')
    o.encoding = 'utf-8'
    o.number = true
    o.relativenumber = true
-- Enable completion:
    o.wildmode = 'longest,list,full'
-- Disables automatic commenting on newline:
    vim.cmd.autocmd('FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Better editor UI:
    o.title = true
    o.background = 'dark'
    o.go = 'a'
    o.mouse = 'a'
    o.hlsearch = true
    o.linebreak = true
    o.clipboard = 'unnamedplus'
    o.showmode = false
    o.ruler = false
    o.laststatus = 0
    o.showcmd = false
    o.conceallevel = 2
    o.cursorline = true
    o.cursorlineopt = 'number,line'
    -- o.cursorlineopt = 'number,line'
    -- o.cursorcolumn = true

-- Better editing experience:
    o.expandtab = true
    o.smarttab = true
    o.tabstop = 4
    o.shiftwidth = 0
    -- if softtabstop value negative, shiftwidth value is used:
        o.softtabstop = -1
    o.list = true
    -- listchars concise
        -- o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
    -- listchars verbose
        -- for 4 spaces indentations
            o.listchars = 'eol:¬,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
        -- for 2 spaces indentations
            -- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:··,leadmultispace:│ ,'
    o.formatoptions = 'qrn1'

-- Case insensitive searching UNLESS /C or capital in search:
    o.ignorecase = true
    o.smartcase = true

-- Undo and backup options:
    o.backup = false
    o.writebackup = true
    -- o.backupdir = '/home/umar/.cache/nvim/backup//'
    o.swapfile = true
    -- o.directory = '/home/umar/.cache/nvim/swap//'
    o.undofile = true
    -- o.undodir = '/home/umar/.cache/nvim/undo//'

-- Remember 100 items in commandline history:
    o.history = 100

-- Better buffer splitting:
    o.splitright = true
    o.splitbelow = true

-- Preserve view while jumping:
    o.jumpoptions = 'view'

-- Stable buffer content on window open/close events:
    o.splitkeep = 'screen'

-- WARN: this won't update the search count after pressing `n` or `N`.
-- When running macros and regexes on a large file, lazy redraw tells
-- neovim/vim not to draw the screen:
    -- o.lazyredraw = true

-- Improve diff (error):
    -- vim.opt.diffopt:append('linematch:60')

-- Remember last layout (fold, cursor location, etc):
    vim.cmd([[
        augroup remember_folds
          autocmd!
          autocmd BufWinLeave * mkview
          autocmd BufWinEnter * silent! loadview
        augroup END
    ]])

-- Turns off highlighting on the bits of code that are changed, so the line
-- that is changed is highlighted but the actual text that has changed stands
-- out on the line and is readable:
    vim.cmd([[
        if &diff
            highlight! link DiffText MatchParen
        endif
    ]])
