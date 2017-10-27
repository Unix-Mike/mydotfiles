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

useros = raw_input("Select OS, o = OSX, l = Linux: ")
if useros == 'l':
    ospath = "./Linux"
elif useros == 'o':
    ospath = "./OSX"
else:
    exit(1)
os.chdir(ospath)
home = expanduser("~")

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
        kk = raw_input("Replace this hosts dot file with the repo version y/n: ")
        if kk == 'y':
           # Do the copy
           print "Copying over the file"
           # src, dst
           shutil.copy2(f,f2)
        elif kk == 'n':
           # Ignore and exit
           print "Ignoring file difference and continuing."
        else:
           print "Yes (y) or No (n) are the only choices"
           exit(1)


