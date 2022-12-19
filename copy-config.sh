# Copy .config dir from archrice

# Remove all dirs and user* file first then copy it again from archrice repo

alias \
	rm="rm -rfv" \
	cp="cp -rfv" \

rm user*

for d in */ ; do
	[ "$d" = ".git" ] && continue
	rm $d
done

cp ~/Repos/archrice/.config/* .
