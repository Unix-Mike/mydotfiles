# .bash_profile
#echo "bash_profile"
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/sbin:/usr/sbin:/usr/local/netbeans-8.2/bin
BASH_ENV=$HOME/.bashrc
export BASH_ENV PATH
unset USERNAME

# 
# Mike's personal settings
#
# My custom prompt for User
#export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "
export PS1="\[\033[0;31m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200")[\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\$\[\e[0m\]"


# My custom prompt for Root
#export PS1="\[\e]0;\w\a\]\n\[\e[1;33;41m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "

# Environment variables
export EDITOR='/usr/bin/vim'
export JAVA_HOME=/usr/java/jdk1.8.0_121
export PATH=$PATH:$JAVA_HOME/bin

# Aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Scripts to run
#ssh root@localhost /root/Scripts/macchg.sh
