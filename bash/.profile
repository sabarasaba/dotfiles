# remap capslock to esc
setxkbmap -option caps:escape
# set compose key
setxkbmap -option compose:ralt
# set keypress repeat speed
xset r rate 360 55
# disable beep sound for backspace
xset b off

export EDITOR=/usr/bin/vim
