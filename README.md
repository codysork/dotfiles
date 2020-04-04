# dotfiles
My dotfiles for my Arch Linux Setup

## Using my dotfiles for your setup

You will have to make some manual changes to my dotfiles for your setup so that
everything will work properly.

## Dependencies
### Download the Official Packages First
####  Using pacman (Arch Linux)

``` pacman -S calcurse cmus compton firefox i3-gaps ranger redshift rofi vim zsh```

#### Using apt-get (Ubuntu, Debian)

### Install the Secondary, Unofficial Packages

These can be downloaded from the Arch User Respositories (AUR) in Arch Linux, or you can download them from their git repositories.

- castero
- keepassxc
- rainbowstream
- todo.sh
- pywal
- youtube-viewer

## Manual Config File Changes
### todo.sh

In your todo.cfg file in located in ``` ~/Scripts/todo/todo.cfg ``` change ``` export TODO_DIR="/home/cody/Sync/Todo" ```
to whatever directory you will be using for your todo.txt files.
