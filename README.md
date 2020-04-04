# dotfiles
My dotfiles for my Arch Linux setup

<img src="https://raw.githubusercontent.com/codysork/dotfiles/master/Pictures/Screenshots/screenshot1.png" />

## Installation and setup
### Download the official Packages first

Using pacman: ``` pacman -S calcurse cmus compton firefox i3-gaps ranger redshift rofi vim zsh```

### Install the secondary packages

These can be downloaded from the Arch User Respositories (AUR) in Arch Linux, or you can download them from their git repositories.

- castero
- keepassxc
- todo.sh
- pywal
- youtube-viewer

### st installation

My dotfiles include [Luke Smith's fork of st](https://github.com/lukesmithxyz/st/tree/131bdf67fda75365e289a2d76ab5c7b242d7fde2). To install st:
``` cd .config/st/
    sudo make install 
```

### todo.sh setup

You will need to make some manual changes if you want to use my todo.sh setup.

In your todo.cfg file in located in ``` ~/Scripts/todo/todo.cfg ``` change ``` export TODO_DIR="/home/cody/Sync/Todo" ```
to whatever directory you will be using for your todo.txt files.

## Custom Hotkeys

- Super+Ctrl+w: Change your wallpaper (and keyboard LEDs if using my [msi-xresources script](https://github.com/codysork/msi-xresources))
  Unless you have an MSI laptop like I do, you will want to change this line in ~/.config/i3/config:
  ``` bindsym $mod+Ctrl+w exec wal -si ~/Pictures/Wallpapers --iterative -o ~/Scripts/keycolors ``` to
  ``` bindsym $mod+Ctrl+w exec wal -si ~/Pictures/Wallpapers --iterative -o```
