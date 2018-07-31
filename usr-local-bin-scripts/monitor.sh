#! /bin/sh

# change current resolution and scale for 1.5x
xrandr --output DP1 --auto --panning 2880x1620 --panning 2880x1620 --scale-from 2880x1620 && xrandr --output eDP1 --off

sleep 1

# restore wallpaper
nitrogen --restore

# restart conky
killall conky
start_conky_maia

# restart dunt
killall dunst
notify-send "All Done :D"
