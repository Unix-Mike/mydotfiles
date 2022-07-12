#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$'
export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "

export EDITOR='/usr/bin/vim'

# Load bash alias file if it exists
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


# MacPorts Installer addition on 2015-10-02_at_22:19:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$PATH:"/Volumes/Mx2/Applications/microchip/xc8/v1.35/bin""
. "$HOME/.cargo/env"
