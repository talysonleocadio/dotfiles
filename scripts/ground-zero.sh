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
$install build-essential curl wget vim git

printWhereYouAre "ZSH"
$install zsh

printWhereYouAre "OH-MY-ZSH"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
removeFile $HOME/.zshrc

printWhereYouAre "OH-MY-ZSH: SPACESHIP"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd $HOME
rm -rf fonts
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

printWhereYouAre "OH-MY-ZSH: ZSH-SYNTAX-HIGHLIGHT"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

printWhereYouAre "FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-zsh

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

printWhereYouAre "Criando os symlinks"
python $HOME/.dotfiles/scripts/symlinks.py