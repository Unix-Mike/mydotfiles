#!/usr/bin/zsh
printf "\n"

function logo ()
{
   lolcat ./logo.txt
}

function root_check ()
{
   if [ $(id -u) -ne 0 ]
     then echo Please run this script as root or using sudo!
     exit
   fi
}

function detect_os ()
{
   detected_os="$(uname -o)"
   if [[ "$detected_os" =~ "Linux" ]]; then
     echo "FOUND Linux"
     detected_os="Linux"
   fi
   if [[ "$detected_os" =~ "Darwin" ]]; then
     echo "Found OSX"
     detected_os="OSX"
   fi
}

function menu ()
{
gum style\
   --border normal\
   --padding "1"\
   --margin "2"\
   --border-foreground "#00ffff"\
   --border-background "#0000ff"\
   "$(gum style\
      --foreground "#00ff00"\
      --background "#000000"\
      "$1")"
}

function LinuxLoop ()
{
   while read p; do
     echo "Checking for $p"
     if [[ "$(pacman -Qk $p)" =~ "total files" ]]; then
        echo "$p is installed"
     else
        echo "Installing $p"
	pacman --noconfirm -S "$p"
     fi
#   done < ./Linux/PKGS.txt
   done < "$1"
}

# cd ./${detected_os}
# bat $(find . -type f -name ".*" | gum choose --limit 2)

# ============= Main =============
# TEMP BYPASS # root_check
echo "Installing basic packages so this script will work properly."
# TEMP LinuxLoop "./Linux/BASIC_PKGS.txt"
printf "Continuing ...\n\n\n"
logo
printf "\n\n"

menu "Dotme Main Menu"

ch=$(gum choose\
   "1. Install these dot files"\
   "2. Install vim directory"\
   "3. Install preferred packages"\
   "Q. Quit")


