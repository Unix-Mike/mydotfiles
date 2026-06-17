# ~/.config/zsh/.zshrc
# -------- History Settings --------
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


# -------- Shell options --------
setopt dot_glob  # include dotfiles
setopt extended_glob # match ~ # ^
setopt vi
setopt CORRECT
setopt NUMERIC_GLOB_SORT

ZSH_THEME="re5et" # My normal theme

DISABLE_UPDATE_PROMPT="true"

# Plugin descriptions
#   git         Adds lots of git short cuts to your aliases
#   aliases     Prints a nice list of all defined aliases. 'acs' is the command. Or 'acs vim' show vim aliases.
plugins=(
	git
  aliases
)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.aliases ]; then
    . ~/.aliases
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
##  export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
