#!/usr/bin/env bash
log "Instalações necessárias para o i3"
$yay i3-gaps picom xautolock feh

log "Instalações para o KDE plasma"
$yay sddm plasma-desktop konsole dolphin discover kate spectacle
systemctl enable sddm
