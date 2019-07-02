#!/bin/bash

function log {
  printf "\n\n"
  echo \[$1\]
}

update="sudo pacman -Syu --noconfirm"
install="sudo pacman -S --noconfirm"
yay="yay -S --aur --noconfirm"

source $HOME/.dotfiles/scripts/system-install/base-install.sh
source $HOME/.dotfiles/scripts/system-install/oh-my-zsh.sh
source $HOME/.dotfiles/scripts/system-install/fzf.sh
source $HOME/.dotfiles/scripts/system-install/dev-environment.sh
source $HOME/.dotfiles/scripts/system-install/neovim.sh
