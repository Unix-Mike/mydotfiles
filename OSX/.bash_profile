alias ll="ls -Flah"
alias lm="ll|more"
alias Teh='The'
alias teh='the'
alias mroe='more'
alias d='/bin/date "+%d_%b_%Y_%H:%M"'

#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$'
export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "

##
# Your previous /Users/mike94560/.bash_profile file was backed up as /Users/mike94560/.bash_profile.macports-saved_2015-02-27_at_17:20:44
##

# MacPorts Installer addition on 2015-02-27_at_17:20:44: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
