#!/bin/sh


RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
origIFS="${IFS}"


echo "${GREEN}Bienvenue dans AutoNmap :) \n"






app="nmap"
if [ $(dpkg-query -W -f='${Status}' "$app" 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    echo "${RED}$app n'est pas installé sur ce système."
    sudo apt-get update
    sudo apt-get install nmap
else
    echo "${GREEN}Nmap est déjà installé."
fi







sleep 3

echo "${NC} Veuillez renseigner l'adresse cible:"

read cible

echo "${NC} Veuillez renseigner les ports ciblés :"


read port
sleep 1



echo "${GREEN} veuillez choisir une des options suivantes: "
echo "${GREEN} 1 découverte d'hotes (-sL)"
echo "${GREEN} 2 TCP ( -sS)"
echo "${GREEN} 3 TCP ACK  (-sA)"
echo "${GREEN} 4 UDP (-sU)"
echo "${GREEN} 5 spoofing addresse IP (-S)"
echo "${GREEN} 6 paquets fragmentés (-f)"
echo "${GREEN} 7 spoofing adresse mac (--spoof-mac)"
echo "${GREEN} 8 os detection ( -A -O) "
echo "${GREEN} 9 detection de service (-sV)"
echo  "${GREEN} 10 scan vulnérabilité (--script-vuln)"
echo "${GREEN} 11 scan agressif (-A)"

echo "${NC}Votre choix :"
read option


if [ $option -eq  1 ] ;
then 
echo "Résultat NMAP $cible  scan découverte d'hotes :" >  $(echo $PWD)/txt/texte.txt
nmap -sL $cible/24 >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt   

elif [ $option -eq  2 ] ;
then 
echo "Résultat NMAP $cible scan TCP :" >  $(echo $PWD)/txt/texte.txt
nmap -sS -p $port $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt   

elif [ $option -eq  3 ] ;
then 
echo "Résultat NMAP $cible scan TCP ACK :" >  $(echo $PWD)/txt/texte.txt
nmap -sA -p $port $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  4 ] ;
then 
echo "Résultat NMAP $cible  scan UDP :" >  $(echo $PWD)/txt/texte.txt
nmap -sU -p $port $cible  >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  5 ] ;
then 
echo "${NC}renseigner l'ip à usurpé :" 
read IP 
echo "Résultat NMAP scan $cible avec spoofing addresse IP  :" >  $(echo $PWD)/txt/texte.txt
nmap -S $IP $cible >>  $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  6 ] ;
then 
echo "Résultat NMAP scan $cible par paquets fragmentés  :" >  $(echo $PWD)/txt/texte.txt
nmap -f -T4 -p $port $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  7 ] ;
then 
echo "${NC}renseigner l'adresse mac à usurpé :"
read MAC
echo "Résultat NMAP scan $cible par spoofing d'adresse Mac  :" >  $(echo $PWD)/txt/texte.txt
nmap --spoof-mac $MAC $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt     
elif [ $option -eq  8 ] ;
then 
echo "Résultat NMAP scan $cible par OS detection  :" >  $(echo $PWD)/txt/texte.txt
nmap -A -O $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  9 ] ;
then
echo "Résultat NMAP scan $cible par detection de service   :" >  $(echo $PWD)/txt/texte.txt
nmap -sV $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq  10 ] ;
then
echo "Résultat NMAP  $cible scan vulnérabilité   :" >  $(echo $PWD)/txt/texte.txt
nmap -sV  --script vuln $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt    
elif [ $option -eq 11 ] ;
then
echo "Résultat NMAP $cible scan agressif :" >  $(echo $PWD)/txt/texte.txt 
nmap -A -T4 $cible >> $(echo $PWD)/txt/texte.txt
cd $(echo $PWD)/txt 
sed -i 'G' texte.txt      
else : 
echo "fin du programme"
exit 0
fi 

echo "fin du programme"
exit 0 
