#!/usr/bin/env bash

function logs {
  printf "\n\n"
  echo \[$1\]
}

export update="sudo pacman -Syu --noconfirm"
export install="sudo pacman -S --noconfirm --needed"
export yay="yay -S --aur --noconfirm --needed"

source $HOME/.dotfiles/scripts/system-install/base-install.sh
source $HOME/.dotfiles/scripts/system-install/oh-my-zsh.sh
source $HOME/.dotfiles/scripts/system-install/fzf.sh
source $HOME/.dotfiles/scripts/system-install/dev-environment.sh
