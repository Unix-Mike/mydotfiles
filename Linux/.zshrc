export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mstuder/.oh-my-zsh"

# Path to qmk firmware
export QMK_HOME="/home/mstuder/Keyboard-software/qmk_firmware"

ZSH_THEME="re5et" # My normal theme

DISABLE_UPDATE_PROMPT="true"

# Plugin descriptions
#   git         Adds lots of git short cuts to your aliases
#   archlinux   Adds lots of pacman, yay, trizen, and pacaur shortcuts. See README in plugins dir.
#   aliases     Prints a nice list of all defined aliases. 'acs' is the command. Or 'acs vim' show vim aliases.

plugins=(
	git
	archlinux
    aliases
)

source $ZSH/oh-my-zsh.sh

# *** Exports ***
export EDITOR='vim'
export TERMINAL='kitty'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.eso_aliases ]; then
    . ~/.eso_aliases
fi

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Mike settings for lf icons
if [ -f ~/.lf-settings ]; then
    . ~/.lf-settings
fi

source <(fzf --zsh)

# New prompt.  Make sure to install starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt vi
setopt CORRECT

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
