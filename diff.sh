#!/bin/bash
# Check for changes in hosts dot files
#
dotdiff() {
   echo "Checking for differences in dot files"
   echo "-------------------------------------"
   find . -type f |sed 's/^.//g'|xargs -I{} sh -c 'echo {};diff .{} ~/{};echo'
}

read -p "Select OS, OSX (1), Linux (2), Solaris (3): " myos
if [ $myos -eq 1 ]; then
	ospath="./OSX"
	cd $ospath
        dotdiff
elif [ $myos -eq 2 ]; then
	ospath="./Linux"
	cd $ospath
        dotdiff
elif [ $myos -eq 3 ]; then
	ospath="./Solaris"
	cd $ospath
        dotdiff
else
	echo "Unknown OS selected. Exiting"
	exit 1
fi

