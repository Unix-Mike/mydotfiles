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
from os.path import expanduser
from pathlib import Path
from colors import Colors
from datetime import datetime

# f_git = mydotfiles
# f_home = home directory


class Dotme:
    def __init__(self):
        self.klr = Colors(True)
        self.ospath = 'none'
        self.useros = 'none'
        self.f_home = 'none'
        self.f_git = 'none'
        self.home = 'none'
        self.home_file = 'none'
        self.head = ''
        self.tail = ''

    def sepline(self):
        for i in list(range(40)):
            print(self.klr.fg_lightgrey + "=", end="")
            print(self.klr.fg_darkgrey + "=", end="")
        print(self.klr.reset)

    def logo(self):
        with open("logo.txt", "r") as dlogo:
            for line in dlogo:
                sys.stdout.write(line)
        return

    def bad_match(self):
        print(
            self.klr.fg_red
            + self.klr.bg_yellow
            + self.klr.bold
            + "*** Mismatch *** between -->"
            + self.klr.reset
            + " "
            + self.klr.fg_cyan
            + self.f_git
            + self.klr.reset
            + " and "
            + self.klr.fg_purple
            + self.f_home
            + self.klr.reset
        )
        print("Displaying file differences...")
        with open(self.f_git, "r") as git_file:
            with open(self.f_home, "r") as local_file:
                diff = difflib.unified_diff(
                    git_file.readlines(),
                    local_file.readlines(),
                    fromfile="git_file",
                    tofile="local_file",
                )
                for line in diff:
                    sys.stdout.write(line)
        self.head, self.tail = os.path.split(self.f_home)
        print(self.klr.bg_black +
            self.klr.fg_cyan +
            "    Select what to do with " +
            self.klr.bold +
            self.klr.bg_yellow +
            self.klr.fg_red +
            " " +
            self.tail +
            " " +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.fg_cyan +
            "1. " +
            self.klr.fg_blue +
            "Copy git file to home directory" +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.fg_cyan +
            "2. " +
            self.klr.fg_blue +
            "Copy home file to git directory" +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.fg_cyan +
            "3. " +
            self.klr.fg_blue +
            "Skip to next file" +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.fg_cyan +
            "4. " +
            self.klr.fg_blue +
            "Do nothing and exit" +
            self.klr.reset)
        kk = input(self.klr.bg_black + self.klr.fg_yellow + "Choice: " + self.klr.reset)
        if kk == '1':
            print("Saving old copy with datestamp")
            # This date string needs to become a filename so no slashes
            dtime = datetime.now().strftime("_%Y-%m-%d_%H-%M-%S")
            sfilenm = self.f_home + dtime
            shutil.copy2(self.f_home, sfilenm)
            print("Home file saved with timestamp")
            shutil.copy2(self.f_git, self.f_home)
            print("Copied from git to home")
            self.sepline()
        elif kk == '2':
            shutil.copy2(self.f_home, self.f_git)
            print("Copied from home to git")
            self.sepline()
        elif kk == '3':
            self.sepline()
            return
        else:
            sys.exit(0)

    def no_match(self):
        print(self.klr.bg_yellow + self.klr.fg_red + "{} is not in home directory".format(self.f_git) + self.klr.reset)
        print(self.klr.fg_green + "Copied {} to home directory".format(self.f_git) + self.klr.reset)
        self.sepline()
        shutil.copy2(self.f_git, self.f_home)

    def os_detector(self):
        self.useros = os.uname()
        if self.useros[0] == "Linux":
            self.ospath = "./Linux"
        elif self.useros[0] == "Darwin":
            self.ospath = "./OSX"
        else:
            print("Unable to determine OS.  Exiting.")
            sys.exit(1)
        return(self.ospath)

    def match_check(self):
        # This handles files only
        self.home_file = Path(self.f_home)
        # Check if the file exists in the home directory
        if self.home_file.is_file():
            #  OK there is a file already by that name in the home directory
            if filecmp.cmp(self.f_git, self.f_home):
                print(self.klr.fg_green + "Files match --> " + self.f_git + self.klr.reset)
                self.sepline()
                return()
            else:
                    self.bad_match()
        else:
                self.no_match()


#  ================== Main Loop =================
if __name__ == "__main__":
    myd = Dotme()
    print()  # Give some space from the prompt when program starts
    #  Print intro
    myd.logo()
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
    # myd.ospath = 'none'
    myd.os_detector()
    os.chdir(myd.ospath)

    home = expanduser("~")

    # Everything is based on what is in the mydotfiles directory
    files = [f for f in os.listdir(".") if os.path.isfile(f)]

    for myd.f_git in files:
        myd.f_home = home + "/" + myd.f_git  # f_home is home dir files

        # Need to test if a file by that name exists in home dir.
        myd.match_check()
    exit(0)

