#!/usr/bin/env bash
log "DEV-ENV: pip e nodejs"
$install python-pip nodejs

log "PYTHON: Flake8, pynvim e ipdb"
pip install --user flake8 pynvim poetry ipdb ipython pyclip

log "JS: Instalação do Eslint, TS e yarn"
sudo npm i -g eslint typescript yarn
