# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/sbin:/usr/sbin
BASH_ENV=$HOME/.bashrc
export BASH_ENV PATH
unset USERNAME

# 
# Mike's personal settings
#
# My custom prompt
export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "

# Environment variables
export EDITOR='/usr/bin/vim'

# Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

