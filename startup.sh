#!/bin/sh

# check autostart-apps-list

APPLIST=$(cat ~/.config/qtile/start-apps)

for i in read $APPLIST; do
  ps auxw | grep -P '\b'$i'(?!-)\b'

  if [ $? != 0 ]
  then
    $i &
    echo "starting $i";
  else
    echo "noting to do!";
  fi;
done


# Keyboard Layout
# setxkbmap es &
# setxkbmap en &

#killall compton;
#compton -b --config ~/.config/compton/compton.conf;

killall picom;
picom -b --config ~/.config/picom/picom.conf;

# startup
spice-vdagent &
ulauncher &
ulauncher-toggle &
