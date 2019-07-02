#!/bin/bash
log "DEV-ENV: pip e n"
$install python-pip
$yay nodejs-n nerd-fonts-hack

log "PYTHON: linter e lib para o neovim"
pip install --user flake8 neovim pipenv vim-vint ipython

log "NODE: Instalação da última versão LTS"
sudo n lts

log "JS: Instalação do Eslint, TS e tslint e yarn"
sudo npm i -g eslint typescript tslint yarn
