#!/bin/bash
# Install dot files to local system
#
# Set your  username
username="mstuder"

mypath=$(eval echo ~${username})
myos="$(/usr/bin/uname -s)"
echo "OS detected = $myos"
if [ $myos == 'Darwin' ]; then
	ospath="$mypath/GitHub/mydotfiles/OSX/"
elif [ $myos == 'Linux' ]; then
	ospath="$mypath/GitHub/mydotfiles/Linux/"
else
	echo "No changes made. Exiting"
	exit 1
fi
cd $ospath

# cp ./.* $mypath  # It barfs on . dirs
find . ! -iregex "\.[a-z]+" -exec cp {} $ospath \;
