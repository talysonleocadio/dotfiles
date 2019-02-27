#!/bin/bash

log "NEOVIM: Instalação de dependências"
yay -S editorconfig-core-c
pip install --user neovim

log "NEOVIM: Criação da pasta e symlink da configuração"
mkdir -p ~/.config/nvim
ln -sf /home/talyson/.dotfiles/nvim/init.vim ~/.config/nvim

log "NEOVIM: Plug e :PlugInstall"
# Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall' +qa
