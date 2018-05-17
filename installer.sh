#!/bin/bash
# Install dot files to local system
#
# read -p "Select OS, OSX (1), Linux (2): " myos
myos="$(/usr/bin/uname -s)"
echo "OS detected = $myos"
if [ $myos == 'Darwin' ]; then
	ospath="~/GitHub/mydotfiles/OSX/"
elif [ $myos == 'Linux' ]; then
	ospath="~/GitHub/mydotfiles/Linux/"
else
	echo "No changes made. Exiting"
	exit 1
fi
cd $ospath
cp ./.* ~
