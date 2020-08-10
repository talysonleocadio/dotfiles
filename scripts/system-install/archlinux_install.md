# Guia de instalação para Arch Linux (Vanilla)

Esse documento tem como objetivo ser um guia pra instalação do ~~Arcão~~ Arch Linux e ser uma referência caso a minha memória falhe algum dia (o que sinceramente não é tão difícil). Caso ce tenha caído aqui, e não tenha curtido o meu passo-a-passo, Você pode ir pro tutorial do [Diolinux](https://diolinux.com.br/2019/07/como-instalar-arch-linux-tutorial-iniciantes.html), o ou pra [documentação oficial da distribuição (em inglês)](https://wiki.archlinux.org/index.php/Installation_guide).

## Avisos!
 - Esse tutorial é para instalações em [UEFI](https://pt.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface), mas caso esteja usando legacy, é só ignorar o passo de criação da partição `/boot` e opte pela tabela de particionamento do tipo `MBR` no processo de particionamento.
 - O servidor gráfico usado nesse passo-a-passo será o [X.Org](https://pt.wikipedia.org/wiki/X.Org), ainda não me converti ao Wayland, quem sabe algum dia.

## Conteúdos:

- [Particionamento do disco](#particionamento-do-disco)
 - saoidjasoaosdj

## Particionamento do disco
