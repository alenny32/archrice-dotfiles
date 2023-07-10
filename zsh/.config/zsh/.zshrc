# Created by newuser for 5.9

######## Umar's config for the Zoomer Shell ########

## Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"
# Load Powerlevel10K
source "$XDG_CONFIG_HOME/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme" 2>/dev/null

## Load ssh key passphrase (will ask for passphrase first).
# keychain $HOME/.ssh/id_ed25519 && source $HOME/.keychain/$HOSTNAME-sh

## virtualenvwrapper config and source
# export WORKON_HOME=$HOME/Workspace/.virtualenvs
# export PROJECT_HOME=$HOME/Workspace
# source /usr/bin/virtualenvwrapper.sh

######################################################################

## Enable colors and change prompt:
## Replaced by Powerlevel10k
# autoload -U colors && colors    # Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd                     # Automatically cd into typed directory.
stty   stop undef                 # Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if exists.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete (case insensitive):
autoload -Uz compinit
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
# Include hidden files.
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        "vicmd") echo -ne '\e[1 q';;      # block
        "viins"|"main") echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

# initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Add movement shortcut
bindkey '^a' beginning-of-line
bindkey -M vicmd '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey -M vicmd '^e' end-of-line
bindkey -s '^o' '^e^ulfcd\n'
bindkey -s '^b' '^ubc -lq\n'
bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-v:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^v' edit-command-line
bindkey -M visual '^[[P' vi-delete

# Load functions:
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functionrc" ] &&
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functionrc"

# Load zsh auto suggestions:
source \
    "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" \
    2>/dev/null

# Load syntax highlighting; should be last.
source \
    "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" \
    2>/dev/null

# Initialise nvm (npm)
source "/usr/share/nvm/init-nvm.sh"
