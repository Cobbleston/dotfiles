#!/bin/bash

pacman -S wget git firefox thunderbird code discord alacritty highlight ranger neovim lazygit sway swaybg mpv grim swaylock swayidle go npm telegram-desktop pamixer xdg-desktop-portal-wlr xdg-desktop-portal-gtk flameshot jq btop

yay -S code-marketplace spotify rofi-lbonn-wayland

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

cp ~/gitrepos/dotfiles/.gitconfig ~/

cp -n ~/gitrepos/dotfiles/.config/* ~/.config/

cp ~/gitrepos/dotfiles/.bashrc ~/
cp ~/gitrepos/dotfiles/.bash_profile ~/

echo "Remeber to add ssh keys, change firefox settings and other \
configurations described in the README.md file"
