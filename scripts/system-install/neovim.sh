#!/bin/bash

log "NEOVIM: Instalação de dependências"

$yay editorconfig-core-c
sudo pip install --user neovim
sudo pip install --user flake8
sudo npm i -g neovim

log "NEOVIM: Criação de pasta e symlink para a conf"
mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/nvim/init.vim ~/.config/nvim
ln -sf ~/.dotfiles/nvim/coc/coc-settings.json ~/.config/nvim

log "NEOVIM: Estrutura de pastas para o coc.nvim"
mkdir -p ~/.config/coc/extensions
ln -sf ~/.dotfiles/nvim/coc/package.json ~/.config/coc/extensions

log "NEOVIM: Vim-Plug e instalação de plugins"
# Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall' +qa
