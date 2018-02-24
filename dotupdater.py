#!/usr/bin/env python
#
# Program to check for dot file differences and update
# as desired.
#
# Written by Mike Studer
# Oct 2017
#
import filecmp
import difflib
import shutil
import sys
import os
from os.path import expanduser

print "This utility checks differences between mydotfiles and users home directory"
print "It gives you the option to replace the files.  It will ask what to do for each file."
print ""
useros = raw_input("Please select OS, o = OSX, l = Linux: ")
if useros == 'l':
    ospath = "./Linux"
elif useros == 'o':
    ospath = "./OSX"
else:
    exit(1)
os.chdir(ospath)
home = expanduser("~")
# Everything is based on what is in the mydotfiles directory
files = [f for f in os.listdir('.') if os.path.isfile(f)]
for f in files:
    f2 = home + '/' + f
#    print "DEBUG" , f , f2
    if (filecmp.cmp( f, f2 )):
        print "Files match,", f
    else:
        print
        print "*** Mismatch,", f, " ***"
        print "host0 is", f
        print "host1 is", f2
        # Do a diff at this point.  
        with open(f, 'r') as hosts0:
            with open(f2, 'r') as hosts1:
                diff = difflib.unified_diff(
                 hosts0.readlines(),
               hosts1.readlines(),
               fromfile='hosts0',
               tofile='hosts1',
             )
                for line in diff:
                    sys.stdout.write(line) 
        print
        # Now check what to do.
        # f = mydotfiles
        # f2 = ~
        print "Select what to do with", f
        print "1. Copy from mydotfiles to ~ "
        print "2. Copy from ~ to mydotfiles"
        print "3. Do nothing and exit"
        kk = raw_input("Choice: ")
        if kk == '1':
            print "Copying mydotfiles to ~ "
            # src, dst
            shutil.copy2(f,f2)
        elif kk == '2':
            print "Copying ~ to mydotfiles "
            # src, dst
            shutil.copy2(f2,f)
        else:
            print "No changes made. Exiting."
            exit(1)


