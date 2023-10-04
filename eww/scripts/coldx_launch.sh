#!/bin/bash

EWW="env XDG_CACHE_HOME=/tmp eww -c $HOME/.config/eww/"

## window list
w_ls="
    coldx \
    profile_window \
    power_menu \
    music_window \ 
    cpu_window \
    launcher_window \
    qoutes_window 
"
## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
fi


## Open widgets 
run_eww() {
    ${EWW} open-many --toggle $w_ls
}

run_eww