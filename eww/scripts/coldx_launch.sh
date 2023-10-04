#!/bin/bash

## window list
w_ls="
    coldx \
    profile_window \
    power_menu \
    music_window \ 
    cpu_window \
    launcher_window \
    qoutes_window \
"
## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	eww daemon
	sleep 1
fi


## Open widgets 
run_eww() {
    eww open-many --toggle $w_ls
}

run_eww