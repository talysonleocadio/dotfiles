#!/bin/bash

function log {
  printf "\n\n"
  echo \[$1\]
}

update="sudo pacman -Syu --noconfirm"
install="sudo pacman -S --noconfirm"
yay="yay -S --aur --noconfirm"

log "Criando os symlinks"
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo ln -sf ~/.dotfiles/g610/profile /etc/g810-led
sudo ln -sf ~/.dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
ln -sf ~/.dotfiles/albert/albert.conf ~/.config/albert
cp ~/.dotfiles/redshift/redshift.conf ~/.config/redshift
ln -sf ~/.dotfiles/termite/config ~/.config/termite
