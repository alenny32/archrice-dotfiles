-- Relaunch polybar whenever config.ini is updated
    vim.cmd.autocmd('BufWritePost config.ini !polybar-msg cmd restart & disown')
-- Relaunch sxhkd whenever sxhkdrc is updated
    vim.cmd.autocmd('BufWritePost sxhkdrc !pkill -USR1 -x sxhkd')
-- Relaunch bspwm whenever bspwmrc is updated
    vim.cmd.autocmd('BufWritePost bspwmrc !bspc wm -r')
-- Relaunch dunst whenever dunstrc is updated
    vim.cmd.autocmd('BufWritePost dunstrc !killall dunst && dunst & disown')

-- Reload sshd config on save.
    vim.cmd.autocmd('BufWritePost /etc/ssh/sshd_config !sudo systemctl reload sshd')
    vim.cmd.autocmd('BufWritePost /var/tmp/sshd_config.* !sudo systemctl reload sshd')

-- Reload kitty config on save.
    vim.cmd.autocmd('BufWritePost *kitty.conf !killall -SIGUSR1 kitty')
    vim.cmd.autocmd('BufWritePost *kitty-theme-*.conf !killall -SIGUSR1 kitty')

-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
    vim.cmd.autocmd('VimLeave *.tex !texclear %')

-- Ensure files are read as what I want:
    vim.cmd.let("g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}")
    vim.keymap.set({'n', 'v', 'o'}, '<leader>v', '<CMD>VimwikiIndex<CR>')
    -- vim.g.vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    vim.cmd.let("g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]")
    vim.cmd.autocmd('BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown')
    vim.cmd.autocmd('BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff')
    vim.cmd.autocmd('BufRead,BufNewFile *.tex set filetype=tex')
    vim.cmd.autocmd('BufRead,BufNewFile *sshd_config* set filetype=sshdconfig')
    vim.cmd.autocmd('BufRead,BufNewFile ${XDG_CONFIG_HOME}/mimeapps.list set filetype=dosini')
    vim.cmd.autocmd('BufRead,BufNewFile /var/tmp/hosts*,/etc/hosts set filetype=hostconf')
    vim.cmd.autocmd('BufRead,BufNewFile *fonts.conf set filetype=xml')
    vim.cmd.autocmd('BufRead,BufNewFile *.desktop* set filetype=desktop')

-- Save file as sudo on files that require root permission
    vim.cmd.cabbrev("w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
    vim.cmd.autocmd('BufWritePre * let currPos = getpos(".")')
    vim.cmd.autocmd('BufWritePre * %s/\\s\\+$//e')
    vim.cmd.autocmd('BufWritePre * %s/\\n\\+\\%$//e')
    vim.cmd.autocmd('BufWritePre * cal cursor(currPos[1], currPos[2])')
    -- add newline
        -- vim.cmd.autocmd('BufWritePre *.[ch] %s/\\%$/\\r/e')

-- When shortcut files are updated, renew bash and ranger configs with new material:
    vim.cmd.autocmd('BufWritePost bm-files,bm-dirs !shortcuts')
-- Run xrdb whenever Xdefaults or Xresources are updated.
    vim.cmd.autocmd('BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults')
    vim.cmd.autocmd('BufWritePost Xdefaults,xdefaults !xrdb %')
    vim.cmd.autocmd('BufWritePost Xresources,xresources !xrdb %; gen-xcolors')
-- Recompile dwmblocks on config edit.
    vim.cmd.autocmd('BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }')
