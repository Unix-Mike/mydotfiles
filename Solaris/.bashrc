export PS1='\u@\h \w \$ '
#=============================================================================
# set LD_LIBRARY_PATH 
export LD_LIBRARY_PATH="/dashboard/instantclient_12_1"
# Only use 32 bit version on Solaris
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/dashboard/instantclient_12_1_0_1_0_32Bit"

# set PATH
export PATH="$PATH:/ws/opg-lab-tools:/opt/solarisstudio12.3/bin:/usr/mysql/5.5/bin"
export PATH="$PATH:/usr/sbin"

# additional path for Mercurial Builds
export PATH="$PATH:/ws/ntrunk/tools/mercurial:/ws/ntrunk/tools"

# add my stuff to PATH
export PATH="$PATH:~/Scripts"

# Set ORACLE_HOME
#export ORACLE_HOME="/mstuder/Oracle_home"
export ORACLE_HOME="/dashboard/instantclient_12_1"
#export ORACLE_HOME="/dashboard/instantclient_12_1_0_1_0_32bit"
#export ORACLE_HOME="/dashboard/instantclient_12_1_0_1_0_64bit"

#
# Man Pages
#
export MANPATH="/usr/man:/usr/share/man:/usr/X/man:/usr/local/man:/usr/dt/man/:/opt/SUNWspro/man"
#export MANPATH="$MANPATH/:/opt/SUNWspro/man/"
#export MANPATH="$MANPATH:/opt/solarisstudio12.3/man"


# Set EDITOR
export EDITOR="/bin/vi"

alias ll="ls -Fla"
alias lm="ll|more"
alias machine=/net/guild/export/labs/db/machine 

