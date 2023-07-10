#!/bin/bash
# Atualiza os pacotes
echo "Atualizando o Arch Linux..."
sudo pacman -Syyuu

echo "Atualizando o Flatpak..."
sudo flatpak update

echo "Atualizando o Snap..."
sudo snap refresh

echo "Atualizando o Flutter"
flutter update

# Pergunta se quer limpar os repositorios
echo "Deseja limpar os repositorios? [S/N]"
read resposta
# Se a resposta for S ele limpa se nao ele continua
if [ $resposta == "S" ] || [ $resposta == "s" ]
then 

echo "Limpando Pacotes Pacman"
sudo pacman -Rs $(pacman -Qtdq)

echo "Limpando Pacotes Flatpak"
flatpak remove --unused

echo "Atualizaçoes Concluidas"

else
echo "Atualizaçoes Concluidas"
fi

