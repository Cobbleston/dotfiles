# Dotfiles, by Konova8

## .config
Eseguire `./setup.py` nella cartella della repo

## Estensione per YT
Aprire le impostazioni e copiare il file `.txt`

## Firefox
change this settings in `about:config`
toolkit.tabbox.switchByScrolling = true

## Polkit
install `pokit-gnome`
copy `/etc/X11/xinit` to `~/.xinitrc` using `cp /etc/X11/xinit ~/.xinitrc`
add `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &` at the end of ~/.xinitrc
