#!/usr/bin/env bash
logs "Otimização dos mirrors e instalação base do sistema"
$update && $install reflector && \
sudo reflector --protocol https --sort score --latest 5 --save /etc/pacman.d/mirrorlist && \
$install base-devel ripgrep firefox tmux rlwrap hidapi zsh redshift xclip chromium bat git

logs "Instalação do yay"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd .. && rm -rf yay

logs "Instalação de programas presentes no AUR"
$yay g810-led-git nerd-fonts-hack albert

log "Criação de pastas para as confs do redshift"
mkdir -p ~/.config/{redshift,albert,i3,i3status}

logs "Symlinks dos programas base do sistema"
ln -sf ~/.dotfiles/albert/albert.conf ~/.config/albert
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
ln -sf ~/.dotfiles/git/.gitconfig ~/
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
cp ~/.dotfiles/redshift/redshift.conf ~/.config/redshift

sudo ln -sf ~/.dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
sudo cp ~/.dotfiles/xorg/plasma-i3.desktop /usr/share/xsessions
sudo cp ~/.dotfiles/g610/profile /etc/g810-led
