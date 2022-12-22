" Umar's config for NeoVim

"" Source settingsasdf
source $XDG_CONFIG_HOME/nvim/settings/general.vim
source $XDG_CONFIG_HOME/nvim/settings/mappings.vim
source $XDG_CONFIG_HOME/nvim/settings/commands.vim
source $XDG_CONFIG_HOME/nvim/settings/functions.vim
source $XDG_CONFIG_HOME/nvim/settings/plug-install.vim
source $XDG_CONFIG_HOME/nvim/settings/plug-settings.vim

"" Theme settings
""" `<leader> + t` for cycling through themes
if filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/themes/onedark.vim"'))
	source $XDG_CONFIG_HOME/nvim/themes/onedark.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Luke's config for NeoVim
