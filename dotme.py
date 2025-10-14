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
import time
import sys
import os
from os.path import expanduser
from pathlib import Path
from datetime import datetime
from colors import Colors

# f_git = mydotfiles
# f_home = home directory


class Dotme:
    '''Main class '''

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
        '''Line seperator'''
        for i in list(range(40)):
            print(self.klr.fg_lightgrey + "=", end="")
            print(self.klr.fg_darkgrey + "=", end="")
        print(self.klr.reset)

    def logo(self):
        '''Print the logo'''
        with open("logo.txt", "r", encoding='utf-8') as dlogo:
            for line in dlogo:
                sys.stdout.write(line)

    def bad_match(self):
        '''Mismatch handler'''
        print(
            self.klr.fg_red
            + self.klr.bg_yellow
            + self.klr.bold
            + "*** Mismatch *** between -->"
            + self.klr.reset
            )
        print(
            "                              "
            + self.klr.fg_orange
            + self.klr.bold
            + self.f_git
            + self.klr.reset
            + " and "
            + self.klr.fg_green
            + self.klr.bold
            + self.f_home
            + self.klr.reset
        )
        print(f"{self.klr.bg_red}{self.klr.fg_yellow}{self.klr.bold}", end='')
        print(f"Displaying file differences...{self.klr.reset}\n")
        with open(self.f_git, "r", encoding='utf-8') as git_file:
            with open(self.f_home, "r", encoding='utf-8') as local_file:
                diff = difflib.unified_diff(
                    git_file.readlines(),
                    local_file.readlines(),
                    fromfile="git_file",
                    tofile="local_file",
                )
                # New fancy formatting of diffs
                for line in diff:
                    if line.startswith("+"):
                        print(f"{self.klr.fg_green}{self.klr.bold}{self.klr.bg_black}", end='')
                        print(f"{line.strip()}{self.klr.reset}")
                    elif line.startswith("-"):
                        print(f"{self.klr.fg_orange}{self.klr.bold}{self.klr.bg_black}", end='')
                        print(f"{line.strip()}{self.klr.reset}")
                    else:
                        # sys.stdout.write(line)
                        print(f"{self.klr.fg_darkgrey}{line.strip()}{self.klr.reset}")
        self.head, self.tail = os.path.split(self.f_home)
        print()
        print(f"{self.klr.bg_black}{self.klr.fg_lightgrey}", end='')
        print(f"Select what to do with {self.klr.reset}  ==> ", end='')
        print(f"{self.klr.bold}{self.klr.bg_yellow}{self.klr.fg_red} {self.tail} {self.klr.reset}")
        print()
        print(self.klr.bg_black +
            self.klr.fg_orange +
            self.klr.bold +
            "1. Copy git file to home directory" +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.fg_green +
            self.klr.bold +
            "2. Copy home file to git directory" +
            self.klr.reset)
        print()
        print(self.klr.bg_black +
            self.klr.fg_lightgrey +
            self.klr.bg_blue +
            self.klr.bold +
            "3. Skip to next file " +
            self.klr.reset)
        print(self.klr.bg_black +
            self.klr.bg_red +
            self.klr.fg_black +
            self.klr.bold +
            "4. Do nothing and exit " +
            self.klr.reset)
        print()
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
            self.pexit()

    def no_match(self):
        '''No matches found handler'''
        print(f"{self.klr.fg_orange}{self.klr.bold}ADDED {self.klr.reset}", end='')
        print(f"{self.klr.fg_green}{self.f_git} to home directory{self.klr.reset}")
        self.sepline()
        shutil.copy2(self.f_git, self.f_home)

    def os_detector(self):
        '''Detect what OS this is being run on'''
        self.useros = os.uname()
        if self.useros[0] == "Linux":
            self.ospath = "./Linux"
        elif self.useros[0] == "Darwin":
            self.ospath = "./OSX"
        else:
            print("Unable to determine OS.  Exiting.")
            sys.exit(1)
        return self.ospath

    def pexit(self):
        '''Program exit message'''
        self.sepline()
        bye = "Goodbye my friend"
        print(f"{bye:^80}")
        self.sepline()
        sys.exit(0)

    def match_check(self):
        '''Check for matching files'''
        # This handles files only
        self.home_file = Path(self.f_home)
        # Check if the file exists in the home directory
        if self.home_file.is_file():
            #  OK there is a file already by that name in the home directory
            if filecmp.cmp(self.f_git, self.f_home):
                print(self.klr.fg_green + "Files match --> " + self.f_git + self.klr.reset)
                self.sepline()
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
    INFOMSG = f"""\
{myd.klr.fg_lightblue}{myd.klr.bold}\
This utility checks differences between this git repo and users home directory.
It gives you the option to replace the files in home with git or vice versa.
It automatically adds files missing in home directory but are in git directory.
The menu lets you skip one file or exit entirely.\
{myd.klr.reset}
"""
    myd.sepline()
    print(INFOMSG, end='')
    myd.sepline()
    print("")
    time.sleep(2)
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
    myd.pexit()
