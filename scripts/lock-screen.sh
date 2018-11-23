#!/bin/bash
icon=$HOME/.dotfiles/i3/lock.png
tmpbg=/tmp/screen.png
scrot /tmp/screen.png
convert $tmpbg -scale 10% -scale 1000% $tmpbg
num_of_screens = xrandr -q | rg 'connected' | wc -l

if [ "$num_of_screens" -lt 1 ];then
  convert $tmpbg $icon -gravity center -composite -matte $tmpbg
fi

i3lock -u -i $tmpbg
