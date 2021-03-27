#!/usr/bin/env bash
log "Otimização dos mirrors"
$update && $install reflector
sudo reflector --protocol https --sort score --latest 5 --save /etc/pacman.d/mirrorlist

log "Instalação de programas base"
$install base-devel ripgrep firefox tmux rlwrap hidapi zsh anki redshift xclip chromium bat git

log "Instalação do yay"
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd .. && rm -rf yay

log "Instalação de programas presentes no AUR"
$yay g810-led-git nerd-fonts-hack albert

log "Criação de pastas para as confs do redshift"
mkdir -p ~/.config/{redshift};

log "Symlinks dos programas base do sistema"
ln -sf ~/.dotfiles/albert/albert.conf ~/.config/albert
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
ln -sf ~/.dotfiles/git/.gitconfig ~/
sudo cp ~/.dotfiles/g610/profile /etc/g810-led
cp ~/.dotfiles/redshift/redshift.conf ~/.config/redshift
