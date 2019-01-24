#!/bin/bash

update="sudo apt update"
upgrade="sudo apt upgrade -y"
install="sudo apt install -y"
addppa="sudo add-apt-repository"

function log {
    printf "\n\n"
    echo \[$1\]
}

function removeFile {
    rm $1
}

log "PPA: vscode"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

log "PPA: kde-connect"
$addppa ppa:webupd8team/indicator-kdeconnect 

log "Atualizando os pacotes"
$update
$upgrade

log "Instalações básicas"
$install build-essential curl wget neovim tilda tmux libhidapi-dev rlwrap emacs code indicator-kdeconnect compton

log "i3 (Gaps)"
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

log "i3+cinnamon"
git clone https://github.com/jbbr/i3-cinnamon.git ~/i3-cinnamon
cd ~/i3-cinnamon && sudo make install
cd .. && rm -rf i3-cinnamon
 
log "Albert"
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install albert

log "ZSH"
$install zsh
chsh -s $(which zsh)

log "OH-MY-ZSH"
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "O diretório já existe removendo..."
    rm -rf $HOME/.oh-my-zsh
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

log "Spacemacs"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

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
rm $HOME/.zshrc

log "RIPGREP"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
sudo dpkg -i ripgrep_0.9.0_amd64.deb
removeFile ripgrep_0.9.0_amd64.deb

log "Remoção das configs default do vscode"
rm -rf $HOME/.config/Code/User/*.json

log "Instalações para o G610"
git clone https://github.com/MatMoul/g810-led.git ~/.g610-led
cd ~/.g610-led
make bin
sudo make install
sudo rm /etc/g810-led/profile
sudo cp $HOME/.g610-led/profile /etc/g810-led

log "Configurações do Neovim"
mkdir -p ~/.config/nvim/colors
ln -sf /home/talyson/.dotfiles/nvim/init.vim ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/tomasr/molokai.git ~/.config/nvim/colors/molokai
mv ~/.config/nvim/colors/molokai/colors/molokai.vim ~/.config/nvim/colors
rm -rf ~/.config/nvim/colors/molokai
vim +'PlugInstall' +qa

log "Criando os symlinks"
ln -sf ~/.dotfiles/zsh/.zshrc ~/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/vscode/settings/* ~/.config/Code/User
ln -sf ~/.dotfiles/ripgrep/.ripgreprc ~/
sudo ln -sf ~/.dotfiles/g610/profile /etc/g810-led
ln -sf ~/.dotfiles/spacemacs/.spacemacs ~/
ln -sf ~/.dotfiles/i3/config ~/.config/i3
ln -sf ~/.dotfiles/i3status/config ~/.config/i3status
