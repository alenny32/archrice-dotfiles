# combine scripts
# copy-config.sh then stow-compat.sh

./copy-config.sh
./stow-compat.sh

# Update git submodule
echo "\033[38;5;196;48;5;231m Update git submodule!! \n Use: git submodule update --init \033[0m"
