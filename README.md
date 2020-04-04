# dotfiles
My dotfiles for my Arch Linux setup

## Screenshots

<img src="https://raw.githubusercontent.com/codysork/dotfiles/master/Pictures/Screenshots/screenshot1.png" />
<img src="https://raw.githubusercontent.com/codysork/dotfiles/master/Pictures/Screenshots/screenshot2.png" />

## Installation and setup
### Download the official packages first

Using pacman: 
```
sudo pacman -S calcurse cmus compton firefox i3-gaps keepassxc mpv ranger redshift rofi vim zsh
```

### Install the secondary packages

These can be downloaded from the Arch User Respositories (AUR) in Arch Linux, or you can download them from their git repositories.

- castero
- pywal
- youtube-viewer

#### Using yay

```
yay -S castero python-pywal youtube-viewer
```

### st installation

My dotfiles include [Luke Smith's fork of st](https://github.com/lukesmithxyz/st/tree/131bdf67fda75365e289a2d76ab5c7b242d7fde2). To install st:
``` 
cd ~/.config/st/
sudo make install 
```

### todo.sh setup

You will need to make some manual changes if you want to use my todo.sh setup.

In your todo.cfg file in located in `~/Scripts/todo/todo.cfg` change 
```
export TODO_DIR="/home/cody/Sync/Todo"
```
to whatever directory you will be using for your todo.txt files.

## Custom Hotkeys
- ` Ctrl ` + ` Super ` + ` Esc `: put your computer in hibernation (see: [Arch Wiki: Power Management#Hibernation](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation))
- ` Ctrl ` + ` Super ` + ` c `: open calcurse
- ` Ctrl ` + ` Super ` + ` e `: open Vim
- ` Ctrl ` + ` Super ` + ` f `: open Firefox
- ` Ctrl ` + ` Super ` + ` k `: open KeepassXC
- ` Ctrl ` + ` Super ` + ` m `: open cmus
- ` Ctrl ` + ` Super ` + ` p `: open castero
- ` Ctrl ` + ` Super ` + ` w `: change your wallpaper (and keyboard LEDs if using my [msi-xresources script](https://github.com/codysork/msi-xresources)).
- ` Ctrl ` + ` Super ` + ` y `: open youtube-viewer video search (videos open in mpv)
- ` Ctrl ` + ` Super ` + ` z `: open youtube-viewer channel search (videos open in mpv)

  Unless you have an MSI laptop like I do, you will want delete 
  `-o ~/Scripts/keycolors ` from this line in ` ~/.config/i3/config `:
  ```
  bindsym $mod+Ctrl+w exec wal -si ~/Pictures/Wallpapers --iterative -o ~/Scripts/keycolors 
  ```
  
