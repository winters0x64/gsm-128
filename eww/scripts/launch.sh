#!/bin/bash

## EWW bin
EWW="env XDG_CACHE_HOME=/tmp eww -c $HOME/.config/eww/"

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} open bar 
}

run_eww
