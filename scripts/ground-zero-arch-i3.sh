#!/bin/bash

function printWhereYouAre {
    printf "\n\n"
    echo \[$1\]
}

function removeFile {
    rm $1
}

update="sudo pacman -Syu"
install="sudo pacman -S --noconfirm"
aur-install="yay -S --aur --noconfirm"

printWhereYouAre "Atualizando pacotes e instalacoes de pacotes presentes nos repositórios do arch-linux"
$update && $install neovim yay ripgrep firefox tmux rlwrap hidapi zsh code anki mintstick clipit

printWhereYouAre "Instalações AUR (Thanks Community)"
$aur-install google-chrome spotify albert

mkdir -p ~/.config/i3

printWhereYouAre "Removendo Default configs do Code"
rm -rf $HOME/.config/Code\ -\ OSS/User/*.json

printWhereYouAre "Removendo default configs do I3"
if [ -d "$HOME/.config/i3"]; then
    echo "O diretório i3 existe, removendo config do i3"
    removeFile $HOME/.config/i3/config
else
    mkdir -p ~/.config/i3
fi

if [ -d "$HOME/.config/i3status"]; then
    echo "O diretório i3status existe, removendo config do i3status"
    removeFile $HOME/.config/i3status/config
else
    mkdir -p ~/.config/i3status
fi

printWhereYouAre "ZSH"
$install zsh
chsh -s $(which zsh)

printWhereYouAre "OH-MY-ZSH"
if [ -d "$HOME/.oh-my-zsh"]; then
    echo "O diretório já existe removendo..."
    rm -rf $HOME/.oh-my-zsh
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

printWhereYouAre "OH-MY-ZSH: SPACESHIP"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
git clone https://github.com/denysdovhan/spaceship-prompt.git \
$HOME/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme \
$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme

printWhereYouAre "OH-MY-ZSH: ZSH-SYNTAX-HIGHLIGHT"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

printWhereYouAre "OH-MY-ZSH: ZSH-AUTOSUGGESTIONS"
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

printWhereYouAre "FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
removeFile $HOME/.zshrc

printWhereYouAre "Configurações do Neovim"
ln -sf /home/talyson/.dotfiles/nvim/init.vim ~/.config/nvim

# Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +'PlugInstall' +qa

printWhereYouAre "Criando os symlinks"
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/vscode/settings/* ~/.config/Code\ -\ OSS/User
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo ln -sf ~/.dotfiles/g610/profile /etc/g810-led
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status

printWhereYouAre "Reinicializando o i3"
i3-msg restart