#!/bin/bash

update="sudo apt update"
upgrade="sudo apt upgrade -y"
install="sudo apt install -y"
addppa="sudo add-apt-repository"

function printWhereYouAre {
    printf "\n\n"
    echo \[$1\]
}

function removeFile {
    rm $1
}

printWhereYouAre "Atualizando os pacotes"
$update
$upgrade

printWhereYouAre "Instalações básicas"
$install build-essential curl wget vim git tilda tmux libhidapi-dev

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
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt
ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

printWhereYouAre "OH-MY-ZSH: ZSH-SYNTAX-HIGHLIGHT"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting

printWhereYouAre "FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
rm $HOME/.zshrc

printWhereYouAre "RIPGREP"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
sudo dpkg -i ripgrep_0.9.0_amd64.deb
removeFile ripgrep_0.9.0_amd64.deb

printWhereYouAre "VS CODE"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
$update
$install code
rm -rf $HOME/.config/Code/User/*.json

printWhereYouAre "Instalações para o G610"
git clone https://github.com/MatMoul/g810-led.git ~/.g610-led
cd ~/.g610-led
make bin
sudo make install
sudo rm /etc/g810-led/profile
sudo cp $HOME/.g610-led/profile /etc/g810-led

printWhereYouAre "Criando os symlinks"
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/vscode/settings/* ~/.config/Code/User
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo ln -sf ~/.dotfiles/g610/profile /etc/g810-led
