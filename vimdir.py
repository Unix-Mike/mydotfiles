#!/usr/bin/env python3
# Program to create and or update .vim directory plugins
# Written by Mike Studer 
# July 2022
#
import subprocess
import sys
import os
#import tarfile
import pathlib
from os.path import expanduser, exists

from colors import Colors



class Vimup:
    def __init__(self):
        self.klr = Colors(True)
        self.home = expanduser("~")
        # The v_path is where it will put the modules
        self.v_path = self.home + '/.vim_test/pack/my-plugins/start/'
        #self.v_path = self.home + '/.vim/pack/my-plugins/start/'

        # Key/Value pairs where Key is the actual directory name the plugin creates for itself
        # You can see where problems occur like with The-NERD-tree vs nerdtree
        self.vrepos = {
                "vim-ale":"https://github.com/dmerejkowsky/vim-ale",
                "lightline.vim":"https://github.com/itchyny/lightline.vim",
                "nerdtree":"https://github.com/preservim/nerdtree",
                "vim-gitbranch":"https://github.com/itchyny/vim-gitbranch",
                "vim-trailing-whitespace":"https://github.com/bronson/vim-trailing-whitespace"
        }
        self.m_list = []
    
    def dir_check(self):      
        # Check for .vim directory. Create it if none.
        if not os.path.isdir(self.v_path):
            print('The ' + self.v_path + ' directory is not present. Creating it...')
            pathlib.Path(self.v_path).mkdir(parents=True, exist_ok=True)
        else:
            print('The ' + self.v_path + ' directory is present. Continuing...')

    def v_listing(self):
        self.m_list = self.vrepos.keys()
        for v_std in self.m_list:
            self.fpath = self.v_path + v_std
            #print(fpath)
            gfile = self.fpath + "/.git"
            if os.path.isdir(self.fpath) and exists(gfile):
                self.git_pull(self.fpath)
            else:
                self.git_clone(self.vrepos[v_std])

    def git_clone(self, gitlink):
        # Create repos if they do not exist
        print("git_clone" + gitlink)
        origWD = os.getcwd() # remember our original working directory
        os.chdir(os.path.join(os.path.abspath(sys.path[0]), self.v_path))
        subprocess.run(["git", "clone", gitlink ], check=True, stdout=subprocess.PIPE).stdout
        os.chdir(origWD) # get back to our original working directory

    def git_pull(self, get_me):
        # For existing repos that just need updating
        print("git pull " + get_me)
        origWD = os.getcwd() # remember our original working directory
        os.chdir(os.path.join(os.path.abspath(sys.path[0]), get_me))
        subprocess.run(["git", "pull"], check=True, stdout=subprocess.PIPE).stdout
        os.chdir(origWD) # get back to our original working directory


#  ================== Main Loop =================
if __name__ == "__main__":
    myv = Vimup()

    print(
        myv.klr.fg_green
        + myv.klr.bold
        + "This utility checks for a .vim directory in the users home directory. \nIt creates the directory and updates modules from the module listing file."
        + myv.klr.reset
    )
    print()
    myv.dir_check()
    print()
    myv.v_listing()
    print()
    #print(myv.m_list)