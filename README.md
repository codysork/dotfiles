# Codys' Dotfiles

These dotfiles were set up on Arch Linux, so using any Arch-based Linux distro such as Arch or Manjaro should allow you to make use of it. The distro you use is not important, but the directions here will assume you are using Arch, or at least its package manager — pacman.

## Packages Used in this Setup

### General Packages

- [yay](https://github.com/Jguer/yay) (this will need to be compiled from source)
- [i3](https://i3wm.org/)
- [picom](https://github.com/yshui/picom)
- [polybar](https://github.com/polybar/polybar)
- [rofi](https://github.com/davatorium/rofi)
- [zsh](https://www.zsh.org/)
- [neovim](https://neovim.io/)
- [rxvt-unicode](https://software.schmorp.de/pkg/rxvt-unicode.html)
- [redshift](https://github.com/jonls/redshift)
- [syli.sh](https://github.com/thevinter/styli.sh)

#### Installation

```
pacman -S i3 picom polybar rofi zsh neovim rxvt-unicode redshift
yay -S syli.sh-git
```

### Packages Used in Conky (WIP)

- [conky](https://github.com/brndnmtthws/conky)
- [gcalci](https://github.com/insanum/gcalcli)
- [todotxt](http://todotxt.org/)

#### Installation

```
pacman -S conky
yay -S gcalcli todotxt
```

### Packages Used in i3 Hotkeys (WIP)

- [emote](https://github.com/tom-james-watson/Emote)

#### Installation

```
yay -S emote
```

