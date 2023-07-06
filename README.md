# Dotfiles

These are my dotfiles for the configuration I use on my laptop and my desktop computer

For the same result you have to install endeavouros with all the base and useful package, with i3 but without the configuration that endeavouros team made at i3 

## Packages
`pacman -S firefox thunderbird code discord alacritty ueberzug ranger lxappearance neovim lazygit`

`yay -S code-marketplace spotify`

Package name | Description
:-: | :-:
`firefox` | Firefox Browser
`thunderbird` | Mail Client
`code` | Visual Studio Code
`discord` | Discord Client
`alacritty` | Terminal Emulator
`ueberzug` | Ranger engine for image preview
`ranger` | Terminal File Manager
`lxappearance` | GUI for GTK themes
`neovim` | NeoVim
`lazygit` | TUI for git repos
`code-marketplace` | Enable the marketplace of VSCode
`spotify` | Spotify Client

## Firefox
Change this settings in `about:config`

`toolkit.tabbox.switchByScrolling = true`

## Enhancer for YT
Open settings from the browser and import the backup file

## Polkit
Install `polkit-gnome`, it may be already installed

Copy `/etc/X11/xinit` to `~/.xinitrc` using `cp /etc/X11/xinit ~/.xinitrc`

Add `/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &` at the end of ~/.xinitrc

