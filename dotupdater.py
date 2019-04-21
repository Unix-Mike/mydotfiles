#!/usr/bin/env python3
#
# Program to check for dot file differences and update
# as desired.
#
# Written by Mike Studer
# Oct 2017
#
# Updated 20 Apr 2019
#
import filecmp
import difflib
import shutil
import sys
import os
from os.path import expanduser

print("This utility checks differences between mydotfiles and users home directory")
print("It gives you the option to replace the files.  It will ask what to do for each file.")
print("")
# useros = input("Please select OS, o = OSX, l = Linux: ")
useros = os.uname()
if useros[0] == 'Linux':
    ospath = "./Linux"
elif useros[0] == 'Darwin':
    ospath = "./OSX"
else:
    exit(1)
os.chdir(ospath)
home = expanduser("~")
# Everything is based on what is in the mydotfiles directory
files = [f for f in os.listdir('.') if os.path.isfile(f)]
for f in files:
    f2 = home + '/' + f  # f2 is home dir files
#    print "DEBUG" , f , f2
    if (filecmp.cmp(f, f2) and os.path.isfile(f2)):
        print("Files match," + f)
    else:
        print()
        print("*** Mismatch, ", f, " ***")
        print("git_file is " + f)
        if os.path.isfile(f2):
            print("local_file is " + f2)
            # Do a diff at this point.
            with open(f, 'r') as git_file:
                with open(f2, 'r') as local_file:
                    diff = difflib.unified_diff(
                     git_file.readlines(),
                     local_file.readlines(),
                     fromfile='git_file',
                     tofile='local_file',
                    )
                    for line in diff:
                        sys.stdout.write(line)
            print
        else:
            print(f + 'Not in home directory')
        # Now check what to do.
        # f = mydotfiles
        # f2 = ~
        print("Select what to do with", f)
        print("1. Copy from mydotfiles to ~ ")
        print("2. Copy from ~ to mydotfiles")
        print("3. Skip to next file")
        print("4. Do nothing and exit")
        kk = input("Choice: ")
        if kk == '1':
            print("Copying mydotfiles to ~ ")
            # src, dst
            shutil.copy2(f, f2)
        elif kk == '2':
            if os.path.isfile(f2):
                print("Copying ~ to mydotfiles ")
                # src, dst
                shutil.copy2(f2, f)
            else:
                print("You can't copy what does not exist!")
        elif kk == '3':
            print("Skipping file " + f)
        else:
            print("No changes made. Exiting.")
            exit(1)
