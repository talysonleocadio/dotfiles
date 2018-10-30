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

printWhereYouAre "Atualizando pacotes e instalacoes basicas"
$update && $install git nvim yay ripgrep

printWhereYouAre "I3 - Aplicando configuracoes personalizadas"
removeFile $HOME/.config/i3/config
removeFile $HOME/.config/i3status/config