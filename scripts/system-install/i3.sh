#!/usr/bin/env bash
log "Instalações necessárias para o i3"
$yay i3-gaps xcompton xautolock

log "Instalações para o KDE plasma"
$yay sddm plasma-desktop konsole dolphin discover kate spectacle
systemctl enable sddm

log "Symlinks dos arquivos de configuração"
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
sudo ln -sf ~/.dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
sudo ln -sf ~/.dotfiles/xorg/plasma-i3.desktop /usr/share/xsessions
