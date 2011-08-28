#!/bin/bash
[[ $1 == "home" ]] && timing="-r 60"
xrandr | grep "VGA1 connected"
CONNECTED=$?

if [[ $CONNECTED -eq 0 ]] ; then
  xrandr --output VGA1 --auto
  sleep 1
  xrandr --output LVDS1 --off
  ratpoison -c "restart"
  sleep 1
  $HOME/.ratpoison/bin/launch_trayer.sh restart
else
  xrandr --output LVDS1 --auto
  sleep 1
  xrandr --output VGA1 --off
  #xrandr --output LVDS -s 1366x768
  ratpoison -c "restart"
  sleep 1
  $HOME/.ratpoison/bin/launch_trayer.sh restart
fi

