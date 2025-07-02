#!/bin/bash
# Check for changes in hosts dot files
#
dotdiff() {
   echo "Checking for differences in dot files"
   echo "-------------------------------------"
   #find . -type f |sed 's/^.//g'|xargs -I{} sh -c 'echo {};diff -q .{} ~/{};echo'
   find . -type f |sed 's/^.//g'|xargs -I{} sh -c 'diff -q .{} ~/{}'
}

os-detector() {
    myos=$(uname -o)
    printf "DEBUG: $myos\n"
}

os-detector

if [[ $myos == "GNU/Linux" ]]; then
	ospath="./Linux"
	cd $ospath
    dotdiff
elif [[ $myos == "Darwin" ]]; then
	ospath="./OSX"
	cd $ospath
    dotdiff
else
	printf "Unknown OS selected. Exiting"
	exit 1
fi

