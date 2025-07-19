export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mstuder/.oh-my-zsh"

# Path to qmk firmware
export QMK_HOME="/home/mstuder/Keyboard-software/qmk_firmware"

ZSH_THEME="re5et"

DISABLE_UPDATE_PROMPT="true"

# Pacman package locations.  Add symlink in oh-my-zsh plugin dir.
# /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
	git
	archlinux
    # zsh-autosuggestions
    # zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# *** Exports ***
export EDITOR='vim'
export TERMINAL='kitty'

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
# echo "DEBUG: zshrc sourced"

# New prompt.  Make sure to install starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
# To switch to a preset version run this example command...
# starship preset gruvbox-rainbow -o ~/.config/starship.toml

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
#
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
