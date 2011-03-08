#!/bin/bash

APPLETS="nm-applet 
  gnome-power-manager 
  gnome-volume-control-applet" 

function launch_trayer() {
  echo "Launching"
  trayer --align right --edge bottom --distance 0 --expand true --transparent true \
	 --alpha 128 --tint 0 --SetDockType true --SetPartialStrut true &
}

function kill_trayer() {	
  pid=$(ps aux | grep trayer | grep -v grep | grep -v $0 | awk '{ print $2 }')
  [[ -z $pid ]] && return 0
  kill -9 $pid
  return 0
}

function launch_applets() {
 for i in $APPLETS ; do 
	sleep 1
	echo "Launching applet: $i"
	$i &
 done
 osd_clock -s 9 &
}

if [[ $1 == "start" ]] ; then
  launch_trayer
  launch_applets
fi

if [[ $1 == "restart" ]] ; then
  kill_trayer  
  kill -9  $(ps aux | grep osd_clock | grep -v grep | awk '{ print $2 }')
  launch_trayer
  launch_applets
fi

  

#( sleep 2 ; ( trayer --align right --edge bottom --distance 0 --expand true --transparent true --alpha 128 --tint 0 --SetDockType ture --SetPartialStrut true & ) 
# nm-applet &  
# gnome-power-manager & 
# gnome-volume-control-applet &
# osd_clock & )   


