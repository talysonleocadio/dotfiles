#!/bin/bash

function log {
    printf "\n\n"
    echo \[$1\]
}

function removeFile {
    rm $1
}

update="sudo pacman -Syu --noconfirm"
install="sudo pacman -S --noconfirm"

log "Atualizando pacotes e instalacoes de pacotes presentes nos repositórios do arch-linux"
$update && $install neovim yay ripgrep firefox tmux rlwrap hidapi zsh anki feh redshift imagemagick xautolock i3-gaps bluez blueberry emacs compton python-pip

log "Instalações AUR (Thanks Community)"
aurinstall="yay -S --aur --noconfirm"
$aurinstall spotify mintstick clipit albert i3-cinnamon mint-y-icons mint-backgrounds-tara nodejs-n g810-led-git spectacle

log "Instalação do nodejs lts"
sudo n lts

log "Removendo default configs do I3"
if [ -d "$HOME/.config/i3" ]; then
    echo "O diretório i3 existe, removendo config do i3"
    removeFile $HOME/.config/i3/config
else
    mkdir -p ~/.config/i3
fi

if [ -d "$HOME/.config/i3status" ]; then
    echo "O diretório i3status existe, removendo config do i3status"
    removeFile $HOME/.config/i3status/config
else
    mkdir -p ~/.config/i3status
fi

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

log "FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
removeFile $HOME/.zshrc

log "Configurações do Neovim"
sudo pip install neovim
mkdir -p ~/.config/nvim/colors
git clone https://github.com/sickill/vim-monokai.git monokai

ln -sf /home/talyson/.dotfiles/nvim/init.vim ~/.config/nvim

# Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall' +qa

log "Pastas de configuração para termite e redshift"
mkdir -p ~/.config/{redshift,termite}

log "Criando os symlinks"
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo ln -sf ~/.dotfiles/g610/profile /etc/g810-led
sudo ln -sf ~/.dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
ln -sf ~/.dotfiles/albert/albert.conf ~/.config/albert
cp ~/.dotfiles/redshift/redshift.conf ~/.config/redshift
ln -sf ~/.dotfiles/termite/config ~/.config/termite
