# Script for making dotfiles compatible for stow

for d in */ ; do
	[ ! -d $d/.config ] && mkdir -v $d/.config
	mv -fv $d/* $d/.config
done
