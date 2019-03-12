#!/bin/bash
log "Instalações necessárias para o i3"
$yay cinnamom i3-gaps i3-cinnamon mint-y-icons mint-backgrounds-tara spectacle xcompton xautolock

log "Symlinks dos arquivos de configuração"
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
sudo ln -sf ~/.dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
