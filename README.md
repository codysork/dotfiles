# dotfiles
My dotfiles for my Arch Linux setup. It makes your desktop look beautiful, and has lots of useful custom hotkeys.

<img src="https://raw.githubusercontent.com/codysork/dotfiles/master/Pictures/Screenshots/screenshot1.png" />

## Installation and setup
### Install the official packages

Using pacman: 
```
sudo pacman -S calcurse cmus firefox keepassxc mpv ranger redshift rofi rxvt-unicode vim zsh
```

### Install the secondary packages

These can be downloaded from the Arch User Respositories, or you can download them from their git repositories.

- castero
- compton-tryone-git
- i3-gaps-rounded-git
- pywal
- youtube-viewer

#### Using yay

```
yay -S castero compton-tryone-git i3-gaps-rounded-git python-pywal youtube-viewer
```

### todo.txt setup

You will need to make some manual changes if you want to use my todo.txt setup.

In your todo.cfg file located in `~/Scripts/todo/todo.cfg` change 
```
export TODO_DIR="/home/cody/Sync/Todo"
```
to whatever directory you will be using for your todo.txt files.

## Hotkeys
### Rebound i3 hotkeys
#### Change focus

- ` Super ` + ` h `: Change focus to left window
- ` Super ` + ` j `: Change focus to right window
- ` Super ` + ` k `: Change focus to lower window
- ` Super ` + ` h `: Change focus to upper window

#### Move windows

- ` Super ` + ` Shift ` + ` h `: Move focused window left
- ` Super ` + ` Shift ` + ` j `: Move focused window down
- ` Super ` + ` Shift ` + ` k `: Move focused window up
- ` Super ` + ` Shift ` + ` h `: Move focused window right

#### Horizontal/Vertical splits

- ` Super ` + ` i `: Split window vertically
- ` Super ` + ` o `: Split window horizontally

### Custom hotkeys
- ` Ctrl ` + ` Super ` + ` Esc `: put your computer in hibernation (see: [Arch Wiki: Power Management#Hibernation](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation))
- ` Ctrl ` + ` Super ` + ` c `: open calcurse
- ` Ctrl ` + ` Super ` + ` e `: open Vim
- ` Ctrl ` + ` Super ` + ` f `: open Firefox
- ` Ctrl ` + ` Super ` + ` k `: kill polybar
- ` Ctrl ` + ` Super ` + ` m `: open cmus
- ` Ctrl ` + ` Super ` + ` p `: open castero
- ` Ctrl ` + ` Super ` + ` w `: change your wallpaper (and keyboard LEDs if using my [msi-xresources script](https://github.com/codysork/msi-xresources)).
- ` Ctrl ` + ` Super ` + ` y `: open youtube-viewer video search (videos open in mpv)
- ` Ctrl ` + ` Super ` + ` z `: open youtube-viewer channel search (videos open in mpv)

  Unless you have an MSI laptop like I do, you will want delete or comment out this line from ` ~/.local/bin/wal-scripts `:
  ```
  sh keycolors 
  ```
  
