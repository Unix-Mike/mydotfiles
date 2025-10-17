#!/usr/bin/env python3
# Program to create and or update .vim directory plugins
# Written by Mike Studer
# July 2022
#
# import subprocess
import sys
import os
# import glob
import shutil
import hashlib
from pathlib import Path
from os.path import expanduser
from colors import Colors


class Vimup:
    def __init__(self):
        self.klr = Colors(True)
        self.home = expanduser("~")
        # The various paths need to be checked first.
        self.start_path = self.home + '/.vim_test/pack/my-plugins/start/'
        self.colors_path = self.home + '/.vim_test/colors/'
        self.ospath = 'none'
        self.useros = 'none'
        self.f_home = 'none'
        self.f_git = 'none'
        self.source_dir = 'none'
        self.dest_dir = 'none'

    def dir_check(self):
        # Check for .vim directories. Create if needed.
        start_p = 0
        colors_p = 0
        if not os.path.isdir(self.start_path):
            print('The ' + self.start_path + ' directory is not present')
            start_p = 1
        else:
            print('The ' + self.start_path + ' directory is OK. Continuing...')
        if not os.path.isdir(self.colors_path):
            print('The ' + self.colors_path + ' directory is not present')
            colors_p = 1
        else:
            print('The ' + self.colors_path + ' directory is OK. Continuing...')
        if colors_p == 1 or start_p == 1:
            kk = input(self.klr.bg_black +
            self.klr.fg_yellow +
            "Would you like the missing ones created? y/n " +
            self.klr.reset)
            if kk == "y":
                if colors_p == 1:
                    print("Creating colors directory")
                    Path(self.colors_path).mkdir(parents=True, exist_ok=True)
                if start_p == 1:
                    print("Creating start directory")
                    Path(self.start_path).mkdir(parents=True, exist_ok=True)
            else:
                print()
                sys.exit

    def vim_colors(self):
        kk = input(self.klr.bg_black + self.klr.fg_yellow + "Would you like install vim color schemes? y/n " + self.klr.reset)
        if kk == "y":
            print("Adding vim colorschemes")
            # Basic copy - copies content and mode bits
            shutil.copy('source.txt', 'destination.txt')
        else:
            sys.exit

    def get_file_hash(self, filepath):
        """Calculate MD5 hash of file"""
        hash_md5 = hashlib.md5()
        with open(filepath, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()

    def copy_if_different(self, filename):
        """Copy file only if content is different"""
        source = os.path.join(self.source_dir, filename)
        dest = os.path.join(self.dest_dir, filename)

        if not os.path.exists(dest):
            shutil.copy2(source, dest)
            return True

        if self.get_file_hash(source) != self.get_file_hash(dest):
            shutil.copy2(source, dest)
            return True

        return False

    def git_clone(self, gitlink):
        # Create repos if they do not exist
        print("git_clone" + gitlink)
#        origWD = os.getcwd()  # remember our original working directory
#        os.chdir(os.path.join(os.path.abspath(sys.path[0]), self.v_path))
#        subprocess.run(["git", "clone", gitlink], check=True, stdout=subprocess.PIPE).stdout
#        os.chdir(origWD)  # get back to our original working directory

    def git_pull(self, get_me):
        # For existing repos that just need updating
        print("git pull " + get_me)
#        origWD = os.getcwd()  # remember our original working directory
#        os.chdir(os.path.join(os.path.abspath(sys.path[0]), get_me))
#        subprocess.run(["git", "pull"], check=True, stdout=subprocess.PIPE).stdout
#        os.chdir(origWD)  # get back to our original working directory

    def os_detector(self):
        self.useros = os.uname()
        if self.useros[0] == "Linux":
            self.ospath = "./Linux"
        elif self.useros[0] == "Darwin":
            self.ospath = "./OSX"
        else:
            print("Unable to determine OS.  Exiting.")
            sys.exit(1)
        return self.ospath

    def sepline(self):
        for i in list(range(40)):
            print(self.klr.fg_lightgrey + "=", end="")
            print(self.klr.fg_darkgrey + "=", end="")
        print(self.klr.reset)


#  ================== Main Loop =================
if __name__ == "__main__":
    myv = Vimup()
    myv.sepline()
    print(
        myv.klr.fg_green
        + myv.klr.bold
        + "This utility checks for a .vim directory in the users home directory. \n"
        + "If needed it will ask then create the needed directories. \n"
        + "This includes the colors dir which has vim themes in it. \n"
        + "And the start directory which has vim modules from github that load at vim startup."
        + myv.klr.reset
    )
    myv.sepline()
    myv.dir_check()
    print()
    myv.sepline()
    myv.vim_colors()
    print()
    myv.sepline()
    # This sets the mydotfiles relative source path depending on the OS you are on
    myv.os_detector()
    # Now change to the that directory
    os.chdir(myv.ospath)

    print("DEBUG: home " + myv.home)
    print("DEBUG: OS " + myv.ospath)

# To list all files in a directory
#     from pathlib import Path
#     is_empty = not any(Path('some/path/here').iterdir())
#
# To list all subdirectories
#     subfolders = [ f.path for f in os.scandir(folder) if f.is_dir() ]
