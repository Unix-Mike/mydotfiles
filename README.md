# mydotfiles
My collection of system dot files for Linux and Mac OSX.  You can view the files by going into either the Linux or OSX subdirectory.  

## dotme.py 
This is the smart updater for your dot files. (** Coming soon .config dirs **) It supports Linux and Mac OSX. And it auto-detects which OS you are running it on. It tries to match your existing dot files with the ones included in this git archive.  In case of mismatch it shows the diffs and allows you to choose what action to take. You can skip just one file or even exit.  Otherwise it automatically installs anything missing.  

### Main screen on a clean run
![dotme-1](https://github.com/user-attachments/assets/8e38719b-759e-4764-9ff1-83208b763a85) 

### Local file diff on one file
![dotme-2](https://github.com/user-attachments/assets/3078f85d-ba3a-40e4-ab62-962522a8796e)



## diff.sh 
This just runs a diff between mydotfiles and your home directory.  No copying is done.  Just a fast way to check all files for diffs.

## colors.py 
A Library used to add ANSI color sequences to text.

## vimdir.py 
(in work) creates a .vim directory in users home directory if it is missing. Then installs some of my favorite plugins. Otherwise it will just update them.
