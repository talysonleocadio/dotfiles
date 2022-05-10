#!/usr/bin/env bash
logs "DEV-ENV: pip e nodejs"
$install python nodejs

curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
python get-pip.py
rm get-pip.py

logs "PYTHON: Flake8, pynvim e ipdb"
pip install --user flake8 pynvim poetry ipdb ipython pyclip

logs "JS: Instalação do Eslint, TS e yarn"
sudo npm i -g eslint typescript yarn
