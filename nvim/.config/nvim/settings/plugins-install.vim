" Vim Script for installing vim plugins using vim-plug

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
	Plug 'tpope/vim-surround'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'jreybert/vimagit'
	Plug 'vimwiki/vimwiki'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-commentary'
	Plug 'ap/vim-css-color'
call plug#end()
