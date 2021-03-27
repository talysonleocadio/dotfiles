#!/usr/bin/env bash

log "ZSH"
$install zsh
chsh -s $(which zsh)

log "OH-MY-ZSH"
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "O diretório já existe removendo..."
    rm -rf $HOME/.oh-my-zsh
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

log "OH-MY-ZSH: SPACESHIP"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

git clone https://github.com/denysdovhan/spaceship-prompt.git \
$HOME/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme \
$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme

log "OH-MY-ZSH: ZSH-SYNTAX-HIGHLIGHT"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

log "OH-MY-ZSH: ZSH-AUTOSUGGESTIONS"
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
