# ~/.config/zsh/.zshenv

# ---------XDG Base direcotries --------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# -------- Editor --------
# Default editor used by git, crontab, etc.
export EDITOR="vim"
export VISUAL="nvim"

# -------- Terminal --------
export TERMINAL='wezterm'

# -------- Language settings --------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -------- Paths --------
# All the paths I use
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mstuder/.oh-my-zsh"

# Path to qmk firmware
export QMK_HOME="/home/mstuder/Keyboard-software/qmk_firmware"

# Path to Starship prompt config
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
