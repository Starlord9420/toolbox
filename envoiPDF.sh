#!/bin/sh



RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
origIFS="${IFS}"



echo "${YELLOW}Bienvenue dans notre programme d'envoi par  mail \n"


app="ssmtp"
app2="mutt"

if [ $(dpkg-query -W -f='${Status}' "$app" 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "${RED}$app n'est pas installé sur ce système."
    apt -y install ssmtp 
else
    echo "${GREEN}$app est installé sur ce système."
    echo "${GREEN}Nous pouvons continuer."
fi

if [ $(dpkg-query -W -f='${Status}' "$app2" 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "${RED}$app n'est pas installé sur ce système."
    apt -y install mutt 
else
    echo "${GREEN}$app est installé sur ce système."
    echo "${GREEN}Nous pouvons continuer."
fi

sleep 2


echo "${NC}vous avez configurer votre service sstmp ? : [Y/N] "

read ssmtp
ssmtp=$(echo $ssmtp | tr '[:upper:]' '[:lower:]')
if [ "$ssmtp" = "no"  ] || [ "$ssmtp" = "n" ] ;
then

echo "vous devez configurer votre service ssmpt ce dernier ce trouve dans le répertoire : /etc/ssmtp/ssmtp.conf"
echo "Nous allons configurer ce dernier."


echo "renseignez votre email :"
read email

echo "renseignez votre serveur de votre messagerie :"

read server

echo "renseignez votre port :"
read port 

echo "renseignez votre mot de passe :"

read mdp

echo "renseignez votre hostname" 
read hostname

echo "" > /etc/ssmtp/ssmtp.conf

echo "root=$email" >> /etc/ssmtp/ssmtp.conf
echo "mailhub=$server:$port" >> /etc/ssmtp/ssmtp.conf
echo "AuthUser=$email" >> /etc/ssmtp/ssmtp.conf
echo "AuthPass=$mdp" >> /etc/ssmtp/ssmtp.conf
echo "hostname=$hostname" >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS=YES" >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf










elif [ "$ssmtp" = "yes"  ] || [ "$ssmtp" = "y" ] ;
then 
echo "Vous possédez les prérequis pour envoyer votre rapport.  " 
echo "Nous pouvons passer la suite. \n"

else  :
echo "${RED} fin du programme."

exit 0

fi


echo "${NC}veuillez renseigner votre destinataire :  ${GREEN}(adresseMail@gmail.com)"

read destinataire 

objet="Rapport Test d'intrusion : "

corps="Bonjour, veuillez trouver ci-dessous le rapport réaliser par l'équipe Hackerwood durant la période définie au préalable. Bien cordialement "

piece="$(echo $PWD)/pdf/file.pdf"
sleep 2

if [ -f "$(echo $PWD)/pdf/file.pdf" ]; then
    echo "${GREEN}Nous possédons bien un fichier à envoyer  est présent dans le dossier : $(echo $PWD)/pdf/file.pdf \n"
    echo "${NC}Nous pouvons procéder a la suite."
    echo "$corps" | mutt -s "$objet" -a "$piece" -- "$destinataire"  
else
    echo "${RED}Nous ne possédons pas de fichier à envoyer ce dernier est absent du dossier $(echo $PWD)/pdf/.\n"
    echo "${RED}Fin de programme"
    exit 0
fi
echo "fin du programme"
exit 0 
