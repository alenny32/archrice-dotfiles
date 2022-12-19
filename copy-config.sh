# Copy .config dir from archrice

# Remove all dir first then copy it again from archrice repo

alias \
	rm="rm -rfv" \
	cp="cp -rfv" \

rm alacritty
rm bspwm
rm fontconfig
rm gtk*
rm guake
rm JetBrains
rm mpv
rm nitrogen
rm nvim

cp ~/Repos/archrice/.config/* .
