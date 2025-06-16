# alias ll="ls -lah"
# Make sure to install eza binary package for nicer ls command
alias ls="eza -a"
alias ll="eza -lag"
alias lm="ll|more"
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias df="df -khl"
alias du="du -h"
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
alias aq='asciiquarium'
alias icat="kitty +kitten icat"
# alias to allow quick checking of new USB serial connections
alias ser="ls /dev/tty*|grep -e 'ttyU' -e 'ttyA'"

alias c=clear
alias s='source ~/.zshrc'

function note {
    fm="Linux-Journal.txt"
    echo "Date: $(date)" >> $HOME/$fm
    echo "$@" >> $HOME/$fm
    echo "" >> $HOME/$fm
    }

