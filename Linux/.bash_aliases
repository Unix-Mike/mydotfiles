# alias ll="ls -lah"
# Make sure to install eza binary package for nicer ls command
alias ls="eza -a"
alias ll="eza -lag"
alias lm="ll|more"
alias ..="cd .."
alias df="df -khl"
alias du="du -h"
#alias ssh="ssh -X"
#alias cal="cal `date +%Y`"
alias mroe='more'
alias teh='the'
alias u2l="tr [:upper:] [:lower:]"
alias l2u="tr [:lower:] [:upper:]"
alias path="echo $PATH|tr ':' '\n'"
alias ggrep="/usr/gnu/bin/grep"
alias aq="asciiquarium"
alias tmx="tmux new -s Mike"
alias lol='lolcat'
alias vi='vim'
alias vzf='vim $(fzf --preview="bat --color always {}")'
#alias ip='ip -4 -c=auto'
alias aq='asciiquarium'
alias icat="kitty +kitten icat"

