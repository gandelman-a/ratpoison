#!/bin/bash

xrandr | grep "VGA1 connected"
CONNECTED=$?
if [[ $CONNECTED -eq 0 ]] ; then
	xrandr --output LVDS1 --off
	xrandr --output VGA1 --auto
	xrandr --output VGA1 -s 1920x1080
	ratpoison -c "restart"
	$HOME/.ratpoison/bin/launch_trayer.sh restart
else
	xrandr --output LVDS1 --auto
	xrandr --output VGA1 --off
	xrandr --output LVDS -s 1366x768
	ratpoison -c "restart"
	$HOME/.ratpoison/bin/launch_trayer.sh restart
fi

