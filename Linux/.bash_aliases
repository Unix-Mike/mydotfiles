# # The ls command changes a lot. Saving old ls aliases in case one dies off.
# alias ll="ls -lah"
# alias ls="eza -a"
# alias ll="eza -lag"
alias ls="lsd -a"
alias ll="lsd -lag"
# By doing lm last then it is univeral
alias lm="ll|more"
# Now if I can just remember all these dot aliases
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
# df and du in a human readable format
alias df="df -khl"
alias du="du -h"
# Typos I like to make.  Hope this list stays short.
alias mroe='more'
alias teh='the'
# Upper case to lower and vice versa.  Just pipe text into the aliases.
alias u2l="tr '[:upper:]' '[:lower:]'"
alias l2u="tr '[:lower:]' '[:upper:]'"
# OMG you MUST have this so you can read your path!
alias path='echo $PATH|tr ":" "\n"'
# I don't think I need this anymore.
alias ggrep="/usr/gnu/bin/grep"
# Nice terminal screensaver to hide what you are doing in a terminal
alias aq="asciiquarium"
# Makes starting tmux a bit easier
alias tmx="tmux new -s Mike"
# Pretty colored ASCII text
alias lol='lolcat'
# vi aliases just in case they are not set already
alias vi='vim'
alias v='vim'
# Make history not show number in front
alias history='history -n'
alias h='history'
# kitty termainl thing
alias icat="kitty +kitten icat"
# alias to allow quick checking of new USB serial connections
alias ser="ls /dev/tty[A,U]*"
# Advanced cp and move commmand aliases
alias cpg="/usr/local/bin/advcp -g"
alias mvg="/usr/local/bin/advmv -g"
# Fuzzy finders
alias pzf="pacman -Qq |fzf --preview='pacman -Qs {1}' |xargs -r pacman -Qi"
alias vzf='vim $(fzf --preview="bat --color always {}")'
alias yzf="yay -Qq |fzf --preview='yay -Qs {1}' |xargs -r yay -Qi"

alias c=clear
# echo "DEBUG: bash_aliases sourced"

function s {
    source /home/mstuder/.bash_aliases
    source /home/mstuder/.zshrc
    }


function note {
    echo "Date: $(date "+%d %b %Y at %H:%M:%S")"
    echo "$@"
    echo ""
    } >> "$HOME/Linux-Journal.txt"
