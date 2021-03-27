#!/usr/bin/env bash
log "DEV-ENV: pip e n"
$install python-pip
$yay nodejs-n

log "PYTHON: Flake8, pynvim e ipdb"
pip install --user flake8 pynvim poetry ipdb

log "VIM: Linter pra vim"
pip install vim-vint

log "NODE: Instalação da última versão LTS"
sudo n lts

log "JS: Instalação do Eslint, TS e yarn"
sudo npm i -g eslint typescript yarn
