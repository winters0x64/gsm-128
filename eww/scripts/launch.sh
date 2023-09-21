#!/bin/bash

## EWW bin
EWW="eww -c $HOME/.config/eww/"

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
