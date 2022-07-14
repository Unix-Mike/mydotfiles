# mydotfiles
My system dot files.

dotme.py - This is the smart updater for your dot files.  It supports Linux and Mac OSX. And it auto-detects which OS you are running it on. It tries to match your existing dot files with the ones included in this git archive.  In case of mismatch it allows you to choose what action to take. You can skip just that file or exit.  Otherwise it automatically installs anything missing.

diff.sh - This just runs a diff between mydotfiles and your home directory.  No copying is done.  Just a fast way to check all files for diffs.

colors.py - A Library used to add ANSI color sequences to text.

vimdir.py creates a .vim directory in users home directory if it is missing. Then installs some of my favorite plugins. Otherwise it will just update them.
