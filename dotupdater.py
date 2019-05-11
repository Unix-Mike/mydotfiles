#!/usr/bin/env python3
#
# Program to check for dot file differences and update
# as desired.
#
# Written by Mike Studer
# Oct 2017
#
# Updated May 2019
#
import filecmp
import difflib
import shutil
import sys
import os
import tarfile
from os.path import expanduser
from pathlib import Path
from colors import Colors

# f_git = mydotfiles
# f_home = ~
klr = Colors(True)


def sepline():
    for i in list(range(40)):
        print(klr.fg_lightgrey + "=", end="")
        print(klr.fg_darkgrey + "=", end="")
    print(klr.reset)


print()
print(
    klr.fg_lightblue
    + klr.bold
    + "This utility checks differences between mydotfiles and users home directory"
    + klr.reset
)
print(
    klr.fg_lightblue
    + klr.bold
    + "It gives you the option to replace the files.  It will ask what to do for each file."
    + klr.reset
)

print("")
# useros = input("Please select OS, o = OSX, l = Linux: ")
useros = os.uname()
if useros[0] == "Linux":
    ospath = "./Linux"
elif useros[0] == "Darwin":
    ospath = "./OSX"
else:
    print("Unable to determine OS.  Exiting.")
    exit(1)
os.chdir(ospath)
home = expanduser("~")
# Everything is based on what is in the mydotfiles directory
files = [f for f in os.listdir(".") if os.path.isfile(f)]
for f_git in files:
    f_home = home + "/" + f_git  # f_home is home dir files
    #    print "DEBUG" , f_git , f_home
    # Need to test if a file by that name exists in home dir.
    home_file = Path(f_home)
    # Check if the file exists in the home directory
    if home_file.is_file():
        if filecmp.cmp(f_git, f_home):
            print(klr.fg_green + "Files match --> " + f_git + klr.reset)
        else:
            print()
            print(
                klr.fg_red
                + klr.bold
                + "*** Mismatch *** between --> "
                + klr.fg_cyan
                + f_git
                + klr.reset
                + " and "
                + klr.fg_purple
                + f_home
                + klr.reset
            )
            print("Displaying file diffs...")
            with open(f_git, "r") as git_file:
                with open(f_home, "r") as local_file:
                    diff = difflib.unified_diff(
                        git_file.readlines(),
                        local_file.readlines(),
                        fromfile="git_file",
                        tofile="local_file",
                    )
                    for line in diff:
                        sys.stdout.write(line)
            print
    else:
        print("{} is not in home directory".format(f_git))
        # Now let user select what to do.
    sepline()
    print(
        "Please select what to do with "
        + klr.fg_yellow
        + "{}".format(f_git)
        + klr.reset
    )
    sepline()
    print("1. Copy git file to home directory")
    if home_file.is_file():
        print("2. Copy from home directory to git directory")
    print("3. Skip to next file")
    print("4. Do nothing and exit")
    if "tgz" in f_git:
        print("5. Copy and extract {}".format(f_git))
        print(klr.bg_yellow + klr.fg_red + "     Not working yet. Only does copy." + klr.reset)
    kk = input("Choice: ")
    if kk == "1":
        print("Copying git file to home directory")
        
        # src, dst
        shutil.copy2(f_git, f_home)
    elif kk == "2":
        if home_file.is_file():
            print("Copying file from home directory to git directory ")
            # src, dst
            shutil.copy2(f_home, f_git)
        else:
            print("You can't copy what does not exist!")
    elif kk == "3":
        print("Skipping file " + f_git)
    elif kk == "5":
        print("Copying {} to home directory".format(f_git))
        shutil.copy2(f_git, f_home)
        # Now extract it
        print("Extracting {} to home directory".format(f_git))
        tar = tarfile.open(f_git, 'r:gz')
        tar.extractall("~")  #   TarFile.extractall(path=".", members=None, *, numeric_owner=False)
        tar.close()
    else:
        print("No changes made. Exiting.")
        exit(1)
    sepline()
    print(klr.fg_lightblue + klr.bold + "Next file".rjust(44) + klr.reset)
    sepline()
