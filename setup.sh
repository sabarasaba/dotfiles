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
sudo cp usr-local-bin-scripts/* /usr/bin/local

# need to:
# backup .ssh folder and keys
# backup .git folder and files
# backup vpn keys
# backup project files
# backup database project pgsql

## Needed packages
# ffmpeg-compat-54
# google-chrome
# insomnia
# libinput-gestures
# nerd-fonts-fira-mono
# ngrok
# nvm
# rxvt-unicode-256xresources
# skypeforlinux-stable-bin
# slack-desktop
# spotify
# sublime-text-dev
# ttf-ms-fonts
# ttf-tahoma
# urxvt-font-size-git
# watchman
# scrot
# gnome-calendar
# docker
# firefox
# gcolor2
# gnome-calculator
# htop
# httrack
# jq
# less
# libreoffice
# lxappearance
# lxinput
# mongodb
# morc_menu
# nautilus
# noto-fonts-emoji
# openvpn
# virtualbox
# pamac
# postgresql
# pgadmin
# powertop
# tlp
# tmux
# transmission-gtk
# tree
# unzip
# yarn
# redis
# ranger
# redshift
# ripgrep
# screenfetch
# sed
# stow
# telegram-desktop
# the_silver_searcher

echo "All done !"
