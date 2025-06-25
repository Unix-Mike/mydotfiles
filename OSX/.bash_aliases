# The ls command changes a lot. Saving old ls aliases in case one dies off.
    # alias ll="ls -lahT"
    # alias ll="eza -lag"
    alias ll="lsd -lag"
    alias ls="lsd -a"
# By doing lm last then it is univeral
    alias lm="ll|more"
# Now if I can just remember all these dot aliases
    alias ..="cd .."
    alias .2="cd ../.."
    alias .3="cd ../../.."
# df and du in a human readable format
    alias df='df -khl'
    alias du='df -h'
# Typos I like to make.  Hope this list stays short.
    alias mroe='more'
    alias teh='the'
# Upper case to lower and vice versa.  Just pipe text into the aliases.
    alias u2l="tr '[:upper:]' '[:lower:]'"
    alias l2u="tr '[:lower:]' '[:upper:]'"
# OMG you MUST have this so you can read your path!
    alias path='echo $PATH| tr ":" "\n"'
# Odds and Ends
    alias ct='column -t'
    alias d='/bin/date "+%d_%b_%Y_%H:%M"'
    alias grc="gnuradio-companion"
    alias s='source ~/.zshrc'
    # To clear screen use ^L
# Makes starting tmux a bit easier
    alias tmx="tmux new -s Mike"
# Make history not show number in front
    alias history='history -n'
    alias h='history'
# Kitty helper aliases
    # image viewer inside the terminal (icat)
    alias icat="kitty +kitten icat"
    # kitty theme browser and selector
    alias themes="kitty +kitten themes"
# Fuzzy finder helpers
    alias vzf='vim $(fzf --preview="bat --color always {}")'
# vi aliases just in case they are not set already
    alias vi='vim'
    alias v='vim'

# Begin FUNCTIONS

function note {
    echo "Date: $(date "+%d %b %Y at %H:%M:%S")"
    echo "$@"
    echo ""
    } >> "$HOME/drafts.txt"


