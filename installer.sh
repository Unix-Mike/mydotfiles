#!/bin/bash
# Install dot files to local system
#
echo "Dumb Installer.  Copies mydotfiles to home directory"
read -p "Select OS, OSX (1), Linux (2), Exit(3): " myos
if [ $myos -eq 1 ]; then
	ospath="./OSX/"
elif [ $myos -eq 2 ]; then
	ospath="./Linux/"
else
	echo "No changes made. Exiting"
	exit 1
fi

cd $ospath
cp ./.* ~
