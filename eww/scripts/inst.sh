#!/bin/bash 

echo "Author : Winters0x64"
echo "Description : This script is only intended for a base linux install, it is not meant for an already configured system"

# Just a seperator
separator(){
    echo " "
    echo "-------------------------------------------"
    echo " "
}

# Install all apps and dependencies
apps_install() {
    echo "[+] Installing all Core Apps/Dependencies..."
    separator
    echo "[+] Here's a list of apps/dependencies that will be installed as part of the core system"
    separator
    echo "[+] Installing git... to install yay..."
    sudo pacman -S --needed --noconfirm --needed git
    mkdir Temp
    cd Temp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ~
    separator
    echo "[+] Installing...alsa-utils,sof-firmware,pulseaudio,brightnessctl,unzip,zip,wl-clipboard,wget,python-pip,man,tlp,tlp-rdw"
    yay -S alsa-utils sof-firmware pulseaudio brightnessctl unzip zip wl-clipboard wget python-pip man tlp tlp-rdw
    separator
    echo "[+] Here's a list of apps/dependencies that will be installed as part of User apps"
    separator
    echo "[+] Installing...nvim,foot,hyprland,hyprpaper,ttf-hack-nerd,eww-wayland,jq,socat,node,npm,google-chrome,fuzzel,swaylock-effects,discord,bleachbit,otf-daddttimemono-git"
    echo "[+] bleachbit,zathura,zathura-pdf-mupdf,btop,dunst"
    yay -S --needed --noconfirm nvim foot hyprland hyprpaper ttf-hack-nerd eww-wayland jq socat node npm google-chrome fuzzel swaylock-effects discord bleachbit otf-daddttimemono-git
    yay -S --needed --noconfirm bleachbit zathura zathura-pdf-mupdf btopi dunst
    separator
    echo "[+] Here's a list of apps/dependencies that will be installed as part of Web exploitation"
    separator
    echo "[+] Installing...docker,burpsuite"
    yay -S --needed --noconfirm docker burpsuite
    separator
    echo "[+] Apps/dependencies Installed"
    separator
    echo "[+] Enabling services"
    sudo systemctl enable docker.service
    sudo systemctl enable tlp.service
    separator
    echo "[+] Installation Done..."
}

# Install Dots (Second Step)
dots() {
    separator
    echo "[+] Installing gsm-128..."
    cd ~/Temp
    git clone https://github.com/winters0x64/gsm-128.git
    cd gsm-128
    mkdir ~/.config/eww
    cp -r ./eww ~/.config/eww
    mkdir ~/.config/hypr
    cp -r ./hypr ~/.config/hypr
    mkdir ~/.config/dunst
    cp -r ./dunst ~/.config/dunst
    mkdir ~/.config/fish
    cp -r ./fish ~/.config/fish
    mkdir ~/.config/foot
    cp -r ./foot ~/.config/foot
    mkdir ~/.config/fuzzel
    cp -r ./fuzzel ~/.config/fuzzel
    mkdir ~/.config/nvim 
    cp -r ./nvim ~/.config/nvim
    mkdir ~/.config/swaylock
    cp -r ./swaylock ~/.config/swaylock
    echo "[+] GSM-128 has been installed"
    separator
    echo "[+] Objective finished, exiting...thanks..."
}

apps_install
dots
