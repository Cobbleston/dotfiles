# Dotfiles
These are my dotfiles for the configuration I use on my laptop and my desktop computer

For the same result you have to install endeavouros with [INSERT PACKAGE], with gnome but without the configuration that endeavouros team made with it

## Packages
`pacman -S wget git firefox thunderbird code discord alacritty highlight ranger
neovim lazygit sway swaybg mpv grim swaylock swayidle go npm telegram-desktop
pamixer xdg-desktop-portal-wlr xdg-desktop-portal-gtk flameshot jq btop`

`yay -S code-marketplace spotify rofi-lbonn-wayland`

Package name | Description
:-: | :-:
`wget` | Wget
`git` | Git
`firefox` | Firefox Browser
`thunderbird` | Mail Client
`code` | Visual Studio Code
`discord` | Discord Client
`foot` | Terminal Emulator
`highlight` | For highlighting text with ranger
`ranger` | Terminal File Manager
`neovim` | NeoVim
`lazygit` | TUI for git repos
`code-marketplace` | Enable the marketplace of VSCode
`spotify` | Spotify Client
`sway` | Windows Manager
`swaybg` | Background setter for sway
`mpv` | CLI video player
`grim` | Screenshot utility
`swaylock` | Lock for sway
`swayidle` | Idle manager
`go` |
`npm` |
`telegram-desktop` | Telegram client
`pamixer` | For getting volume level for WM status bar
`xdg-desktop-portal-wlr` | Screen Sharing in Wayland
`xdg-desktop-portal-gtk` | Screen Sharing in Wayland (fallback)
`flameshot` | Screenshot Software
`jq` | JSON formatter for CLI
`btop` | Improved version of `top`

## Cofigurations
### GTK
`gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'`

### Git
Add ssh keys for logging

> Copy `.gitconfig` for personal settings

`cp ~/gitrepos/dotfiles/.gitconfig ~/`

### Firefox
Change this settings in `about:config`

`toolkit.tabbox.switchByScrolling = true`

Enable sync and use all extensions

### Enhancer for YT
Open settings from the browser and import the backup file

### Config files
> Copy all file from `dotfiles/.config` to `~/.config/` without overwrite anything

`cp -n ~/gitrepos/dotfiles/.config/* ~/.config/`

### Bash
> Copy `.bashrc` and `.bash_profile` inside the home directory

`cp ~/gitrepos/dotfiles/.bashrc ~/`

`cp ~/gitrepos/dotfiles/.bash_profile ~/`

### Split Ergo Keyboard
TODO instruction for ibus

### Thunderbird
TODO gruvbox theme

TODO setup email

TODO setup calendar (?)
