#! /bin/bash

# change current resolution and scale for 1.5x
xrandr --output HDMI1 --auto --panning 3840x2160 --panning 3840x2160 --scale-from 3840x2160

# restore wallpaper
nitrogen -restore

# restart conky
killall conky
start_conky_maia
