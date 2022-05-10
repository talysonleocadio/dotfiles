#!/usr/bin/env bash

logs "FZF"

if [ -d "$HOME/.fzf" ]; then
    rm -rf $HOME/.fzf
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-zsh
