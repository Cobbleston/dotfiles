# Dotfiles

These are my dotfiles for the configuration I use on my laptop

For the same result you have to install endeavouros with all the base and useful package, with i3 but without the configuration that endeavouros team made at i3 

## Packages
`pacman -S code discord alacritty ueberzug`

`yay -S code-marketplace spotify lightdm-webkit2-theme-arch`

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
Install `pokit-gnome`, it may be already installed

Copy `/etc/X11/xinit` to `~/.xinitrc` using `cp /etc/X11/xinit ~/.xinitrc`

Add `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &` at the end of ~/.xinitrc

## LightDM
Modify `/etc/lightdm/lightdm.conf` changing greeter session with `greeter-session=lightdm-webkit2-greeter`

Modify `/etc/lightdm/lightdm-webkit2-greeter.conf` changing the theme with `webkit_theme = arch`

## Laptop
### .config
Run `./setup.py laptop` in the folder of the repo, it will copy all the files that need to go in the `.config` folder

## Desktop
### .config
Run `./setup.py laptop` in the folder of the repo, it will copy all the files that need to go in the `.config` folder

---

## TODO
- [x] LightDM theme
- [x] Polkit
- [ ] Mettere più cose possibili nello script
