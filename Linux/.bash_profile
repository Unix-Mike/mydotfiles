export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "

export EDITOR='/usr/bin/vim'

# Load bash alias file if it exists
if [ -f ~/.bash_aliases ]; then
	        . ~/.bash_aliases
fi


