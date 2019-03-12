#!/bin/bash
log "Otimização dos mirrors"
$install reflector
sudo reflector --protocol https --sort score --latest 5 --save /etc/pacman.d/mirrorlist

log "Update e instalação de programas dos repositórios oficiais"
$update && $install yay ripgrep firefox tmux rlwrap hidapi zsh anki redshift xclip

log "Instalações AUR"
$yay spotify mintstick clipit albert g810-led-git

log "Criação de pastas para receber as confs do termite e redshift"
mkdir -p ~/.config/{redshift,termite};

