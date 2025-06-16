# alias ll="ls -lahT"
# alias ll="eza -lag"
alias ll="lsd -lag"
alias ls="lsd -a"
alias lm="ll|more"
alias df='df -h'
alias u2l="tr '[:upper:]' '[:lower:]'"
alias l2u="tr '[:lower:]' '[:upper:]'"
alias ct='column -t'
alias d='/bin/date "+%d_%b_%Y_%H:%M"'
alias path='echo $PATH| tr ":" "\n"'
alias grc="gnuradio-companion"
alias tmx="tmux new -s Mike"
# Make history not show number in front
alias history='history -n'
alias h='history'
alias vzf='vim $(fzf --preview="bat --color always {}")'
#Short cut to my ESO addons directory
alias eso="cd /Users/michaelstuder/Documents/Elder\ Scrolls\ Online/live/AddOns"

# Aliases for my common typos
alias teh='the'
alias mroe='more'

alias c=clear
alias s='source ~/.zshrc'

function note {
    echo "Date: $(date "+%d %b %Y at %H:%M:%S")"
    echo "$@"
    echo ""
    } >> "$HOME/drafts.txt"


