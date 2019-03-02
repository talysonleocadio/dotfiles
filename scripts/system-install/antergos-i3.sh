#!/bin/bash

function log {
  printf "\n\n"
  echo \[$1\]
}

update="sudo pacman -Syu --noconfirm"
install="sudo pacman -S --noconfirm"

log "Otimização dos mirrors"
$install reflector
sudo reflector --protocol https --sort score --latest 5 --save /etc/pacman.d/mirrorlist

log "Atualizando pacotes e instalacoes de pacotes presentes nos repositórios do arch-linux"
$update && $install yay ripgrep firefox tmux rlwrap hidapi zsh anki redshift xclip 

log "Instalações AUR"
yay="yay -S --aur --noconfirm"
$yay spotify mintstick clipit albert g810-led-git

log "Pastas de configuração para termite e redshift"
mkdir -p ~/.config/{redshift,termite};

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
