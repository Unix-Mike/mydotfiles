#export PS1='\u@\h \w \n\$ '
#export PS1="\[\e]0;\w\a\]\n\[\e[1;32;42m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ "
export PS1="\[\e]0;\w\a\]\n\[\e[1;33;42m\] \u \[\e[0m\] on \[\e[1;33;46m\] \h \[\e[0;33m\] \w\[\e[0m\]\n\$ "
#=============================================================================
# set LD_LIBRARY_PATH 
export LD_LIBRARY_PATH="/dashboard/instantclient_12_1"
# Only use 32 bit version on Solaris
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/dashboard/instantclient_12_1_0_1_0_32Bit"

# set PATH
export PATH="/usr/gnu/bin:/usr/bin:/bin"
#echo "DEBUG: Path set to this: $PATH"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/ws/opg-lab-tools:/opt/solarisstudio12.4/bin:/usr/mysql/5.5/bin"

# Set ORACLE_HOME
#export ORACLE_HOME="/mstuder/Oracle_home"
export ORACLE_HOME="/dashboard/instantclient_12_1"
#export ORACLE_HOME="/dashboard/instantclient_12_1_0_1_0_32bit"
#export ORACLE_HOME="/dashboard/instantclient_12_1_0_1_0_64bit"

# Set MANPATH
#export MANPATH="$MANPATH:/opt/solarisstudio12.3/man"
export MANPATH="$MANPATH:/usr/man:/opt/solarisstudio12.4/man"

# Set EDITOR
export EDITOR="/bin/vi"

alias ll="ls -Fla"
alias lm="ll|more"
alias machine=/net/guild/export/labs/db/machine 

#source ~/.bashrc

