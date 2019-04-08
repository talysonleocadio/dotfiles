#!/bin/bash
log "Otimização dos mirrors"
$install reflector
sudo reflector --protocol https --sort score --latest 5 --save /etc/pacman.d/mirrorlist

log "Instalação de programas base"
$update && $install yay ripgrep firefox tmux rlwrap hidapi zsh anki redshift xclip chromium bat

log "Instalação de programas presentes no AUR"
$yay spotify mintstick g810-led-git

log "Criação de pastas para as confs do termite e redshift"
mkdir -p ~/.config/{redshift,termite};

log "Symlinks dos programas base do sistema"
ln -sf ~/.dotfiles/termite/config ~/.config/termite
ln -sf ~/.dotfiles/albert/albert.conf ~/.config/albert
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo cp ~/.dotfiles/g610/profile /etc/g810-led
cp ~/.dotfiles/redshift/redshift.conf ~/.config/redshift
