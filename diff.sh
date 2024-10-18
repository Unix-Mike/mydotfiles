#!/bin/bash
# Check for changes in hosts dot files
#
dotdiff() {
   echo "Checking for differences in dot files"
   echo "-------------------------------------"
#   find . -type f |sed 's/^.//g'|xargs -I{} sh -c 'echo {};diff -q .{} ~/{};echo'
   # Note: It matches diff: and differ
   find . -type f |sed 's/^.//g'|xargs -I{} sh -c 'diff -q .{} ~/{}|grep -e "diff"'
}

myos=$(uname -o)
if [ $myos == "Darwin" ]; then
	ospath="./OSX"
	cd $ospath
	printf "OSX detected $ospath\n\n"
        dotdiff
elif [ $myos == "GNU/Linux" ]; then
	ospath="./Linux"
	cd $ospath
	printf "Linux detected $ospath\n\n"
        dotdiff
else
	echo "Unknown OS selected. Exiting"
	exit 1
fi

