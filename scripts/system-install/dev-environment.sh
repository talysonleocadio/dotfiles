#!/bin/bash
log "DEV-ENV: pip e n"
$install python-pip 
$yay nodejs-n 

log "PYTHON: linter e lib para o neovim"
sudo pip install --upgrade flake8 neovim

log "NODE: Instalação da última versão LTS"
sudo n lts

log "JS: Instalação do Eslint e TS"
sudo npm i -g eslint typescript
