#!/usr/bin/bash
printf "\n"

function logo ()
{
   lolcat --freq=0.4 ./logo.txt
}

function root_check ()
{
   if [ "$(id -u)" -ne 0 ]
     then echo Please run this script as root or using sudo!
     exit
   fi
}

function detect_os ()
{
   detected_os="$(uname -o)"
   if [[ "$detected_os" =~ "Linux" ]]; then
     #printf "FOUND Linux"
     detected_os="Linux"
   fi
   if [[ "$detected_os" =~ "Darwin" ]]; then
     #printf "Found OSX"
     detected_os="OSX"
   fi
}

function menu ()
{
gum style\
   --border normal\
   --padding "0"\
   --margin "1"\
   --border-foreground "#00ffff"\
   --border-background "#0000ff"\
   "$(gum style\
      --foreground "#00ff00"\
      --background "#000000"\
      --align center \
      --width 80\
      "$1")"
}

 function gmsg ()
 {
   gum style\
      --foreground "#F0B27A"\
      --background "#000000"\
      --align center \
      --width 80\
      "$1"
}

function LinuxLoop ()
{
   while read -r p; do
    echo "Installing $p"
	sudo pacman --noconfirm -S "$p" --needed
#   done < ./Linux/PKGS.txt
   done < "$1"
}


# ================================
# ============= Main =============
# ================================

# Check what OS this is running on, Linux or Mac
detect_os
echo "Installing basic packages so this script will work properly."
# LinuxLoop "./Linux/BASIC_PKGS.txt" # This works it just gets annoying after everything is in sync
printf "Continuing ...\n\n\n"
logo
menu "Dotme Main Menu for $detected_os"

# Primary menu of operations
ch=$(gum choose\
   "Install these git dot files"\
   "Install vim directory"\
   "Install preferred packages"\
   "Quit")

# Now handle the users choice
 if [[ "$ch" =~ "dot" ]]; then
    gmsg "Installing dot files"
# Need to move original users file to a new filename with a date extension
    # Buggy... find "./$detected_os/.*" -maxdepth 1 -type f -exec cp -t ~/testdir {} "{}_$(date +%Y%m%d-%H:%M)" +
    find "./$detected_os/.*" -maxdepth 1 -type f -exec cp -t ~/testdir  "{}_$(date +%Y%m%d-%H:%M)" +
#    find "./$detected_os/.*" -maxdepth 1 -type f -exec cp -t ~/testdir {} +

 elif [[ "$ch" =~ "vim" ]]; then
    gmsg "Installed vim environment"
    cp -r "./$detected_os/.vim/" ~/testdir

 elif [[ "$ch" =~ "packages" ]]; then
    printf "Installed packages\n"
    if [[ "$detected_os" =~ "Linux" ]]; then
       printf "DEBUG 1"
       LinuxLoop "./Linux/PKGS.txt"
       gmsg "Installed the packages"
    elif [[ "$detected_os" =~ "OSX" ]]; then
       gmsg "(Unsupported) Mac OS needs packages to be brew installed."
    fi

 elif [[ "$ch" =~ "Quit" ]]; then
    gmsg "Exiting by request"

 else
    # Just in case something weird happens
    menu "Unknown command, exiting!"
    exit
 fi

# Parting friendly message
menu "Thanks for coming by!"


