# Dotfiles

These are my dotfiles for the configuration I use on my laptop and my desktop computer

For the same result you have to install endeavouros with all the base and useful package, with i3 but without the configuration that endeavouros team made at i3 

## Packages
`pacman -S code discord alacritty ueberzug ranger xmonad xmonad-contrib lxappearance`

`yay -S code-marketplace spotify catppuccin-gtk-theme`

## Visual Studio Code
Install these extensions:
- Python (Jupyter)
- C/C++
- Markdown All in One
- Fast Unicode Math Characters
- Unicode Latex

## Firefox
Change this settings in `about:config`

`toolkit.tabbox.switchByScrolling = true`

## Enhancer for YT
Open settings from the browser and import the backup file

## Polkit
Install `polkit-gnome`, it may be already installed

Copy `/etc/X11/xinit` to `~/.xinitrc` using `cp /etc/X11/xinit ~/.xinitrc`

Add `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &` at the end of ~/.xinitrc

## .config
Create all the symlink with `ln -sf [SOURCE] [FILE-DIR]` in `~/.config/*`
