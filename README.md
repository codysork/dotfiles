# Codys' Dotfiles

These dotfiles were set up on Arch Linux, so using any Arch-based Linux distro such as Arch or Manjaro should allow you to make use of it. The distro you use is not important, but the directions here will assume you are using Arch, or at least its package manager — pacman.

## Packages Required

- [i3](https://i3wm.org/)
- [polybar](https://github.com/polybar/polybar)
- [rofi](https://github.com/davatorium/rofi)
- [rxvt-unicode](https://software.schmorp.de/pkg/rxvt-unicode.html)

### Installation

```
pacman -S i3 polybar rofi rxvt-unicode
```

## Optional Packages (But Configured in this Setup)

- [yay](https://github.com/Jguer/yay) (this will need to be compiled from source)
- [neovim](https://neovim.io/)
- [zsh](https://www.zsh.org/)
- [todotxt](http://todotxt.org/)

### Installation

```
pacman -S neovim zsh
yay -S todotxt
```

