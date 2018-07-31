#! /bin/bash

echo "Install dependencies"
suo pacman -S stow vim tmux dmenu ack dunst dconf rxvt-unicode i3-scrot i3exit nitrogen redshift

echo "Symlink configs using stow.."
stow bash
stow x
stow vim
stow tmux
stow i3
stow dmenu
stow ack
stow kitty

sudo cp conky/conky_maia /usr/share/conky

echo "All done !"
