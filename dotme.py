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
# f_home = home directory

class Dotme:
    def __init__(self):
        klr = Colors(True)

    def sepline(self):
        for i in list(range(40)):
            print(klr.fg_lightgrey + "=", end="")
            print(klr.fg_darkgrey + "=", end="")
        print(klr.reset)
        return

    def logo(self):
        with open("logo.txt", "r") as dlogo:
            for line in dlogo:
                sys.stdout.write(line)
        return

    def match_check(self):
        global f_home
        global f_git
        global home
        home_file = Path(f_home)
        if "tgz" in f_git:
            print("A tgz file was detected")
            # Open tar file
            tar = tarfile.open(f_git, 'r:gz')
            # See whats in tar file
            for tarinfo in tar:
                if tarinfo.isdir():
                    #  print("{} a directory.".format(tarinfo.name))
                    # Grabs first dir in tar file which should be the base directory
                    t_file =  tarinfo.name
                    t_file = home + '/' + t_file
                    tfile = Path(t_file)
                    #  print("DEBUG: " + t_file)               
                    if tfile.is_dir():
                        print("A directory already exists in home named " + tarinfo.name)
                    else:
                        print(klr.fg_green + "Copied {} to home directory".format(tarinfo.name) + klr.reset)
                        tar.extractall(home)  #   TarFile.extractall(path=".", members=None, *, numeric_owner=False)
                    sepline()
                    return()
            tar.close()
            sepline()
        else:
            # Check if the file exists in the home directory
            if home_file.is_file():
                #  OK there is a file already by that name in the home directory
                if filecmp.cmp(f_git, f_home):
                    print(klr.fg_green + "Files match --> " + f_git + klr.reset)
                    sepline()
                    return()
                else:
                    bad_match()
            else:
                no_match()
            
        
    def bad_match(self):
        print(
            klr.fg_red
            + klr.bg_yellow
            + klr.bold
            + "*** Mismatch *** between -->"
            +klr.reset
            +" "
            + klr.fg_cyan
            + f_git
            + klr.reset
            + " and "
            + klr.fg_purple
            + f_home
            + klr.reset
        )
        print("Displaying file differences...")
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
        print(klr.bg_black + klr.fg_cyan + "          Select what to do" + klr.reset)
        print(klr.bg_black + klr.fg_green + "1. Copy git file to home directory" + klr.reset)
        print(klr.bg_black + klr.fg_green + "2. Copy home file to git directory" + klr.reset)
        print(klr.bg_black + klr.fg_green + "3. Skip to next file" + klr.reset)
        print(klr.bg_black + klr.fg_green + "4. Do nothing and exit" + klr.reset)
        kk = input(klr.bg_black + klr.fg_yellow + "Choice: " + klr.reset)
        if kk == '1':
            print("Copied from git to home")
            shutil.copy2(f_git, f_home)
            sepline()
        elif kk == '2':
            print("Copied from home to git")
            shutil.copy2(f_home, f_git)
            sepline()
        elif kk == '3':
            sepline()
            return
        else:
            exit(0)

    def no_match(self):
        print(klr.bg_yellow + klr.fg_red + "{} is not in home directory".format(f_git) + klr.reset)
        print(klr.fg_green + "Copied {} to home directory".format(f_git) + klr.reset)
        sepline()
        shutil.copy2(f_git, f_home) 

    def os_detector(self):
        global ospath
        useros = os.uname()
        if useros[0] == "Linux":
            ospath = "./Linux"
        elif useros[0] == "Darwin":
            ospath = "./OSX"
        else:
            print("Unable to determine OS.  Exiting.")
            exit(1)
        return(ospath)

#  ================== Main Loop =================
if __name__ == "__main__":
    myd = Dotme()

    print()  #  Give some space from the prompt when program starts
    #  Print intro
    logo()
    print(
        myd.klr.fg_lightblue
        + myd.klr.bold
        + "This utility checks differences between mydotfiles and users home directory"
        + myd.klr.reset
    )
    print(
        myd.klr.fg_lightblue
        + myd.klr.bold
        + "It gives you the option to replace the files.  It automatically adds missing files."
        + myd.klr.reset
    )

    print("")
    ospath = 'none'
    myd.os_detector()
    os.chdir(ospath)
    home = expanduser("~")

    # Everything is based on what is in the mydotfiles directory
    files = [f for f in os.listdir(".") if os.path.isfile(f)]
    for f_git in files:
        f_home = home + "/" + f_git  # f_home is home dir files
        # Need to test if a file by that name exists in home dir.
        myd.match_check()
    exit(0)

