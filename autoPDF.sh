#!/bin/sh


RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
origIFS="${IFS}"





echo  "${GREEN}                    $$\ $$$$$$\ "   
echo  "${GREEN}                    $$ |$$ __$$\ "
echo    "${GREEN}  $$$$$$\ $$$$$$$ |$$ / \__|"
echo "${GREEN}  $$ __$$\ $$ __$$ |$$$$\     "
echo "${GREEN}  $$ / $$ |$$ / $$ |$$ _|    "
echo "${GREEN}  $$ | $$ |$$ | $$ |$$ |      "
echo "${GREEN}  $$$$$$$ |\$$$$$$$ |$$ |      "
echo "${GREEN}  $$ ____/ \_______|\__|      "
echo "${GREEN}  $$ |                         " 
echo "${GREEN}  $$ |                          "
echo "${GREEN}  \__|                          \n"



echo "${NC}####################################"
echo "${YELLOW}Bienvenue  sur  ConvertPDF :"
echo "${NC}####################################\n"




if which pandoc >/dev/null; then
  echo "Pandoc est installé"
else
 
 echo "Pandoc n'est pas installé"

apt -y install pandoc

fi



if [ -x "$(command -v libreoffice)" ]; then
    echo "LibreOffice est installé. \n Passons à la suite. "
else
    echo "LibreOffice n'est pas installé. \n Voulez vous l'installer ?"
 	
	apt update -y 

apt -y install libreoffice
	
	
	echo "${GREEN}le service libreOffice   "
	echo " Nous pouvons procéder a la suite \n "



fi 	





sleep 4







pandoc -f markdown -t docx -o $(echo $PWD)/wrd/test.docx $(echo $PWD)/txt/texte.txt
pandoc -f markdown -t docx -o $(echo $PWD)/wrd/ddos.docx $(echo $PWD)/txt/slowloris.txt


content=$(unzip -p $(echo $PWD)/wrd/test.docx word/document.xml)
content=$(unzip -p $(echo $PWD)/wrd/ddos.docx word/document.xml)




content=$(unzip -p $(echo $PWD)/wrd/test.docx word/document.xml)
content=$(unzip -p $(echo $PWD)/wrd/ddos.docx word/document.xml)



rm  $(echo $PWD)/txt/*

	


WATCH_DIR=$(echo $PWD)/wrd
WATCH_PDF=$(echo $PWD)/pdf



path_to_file1=$(echo $PWD)/template.docx
path_to_file2=$(echo $PWD)/wrd/test.docx
path_to_file3=$(echo $PWD)/wrd/ddos.docx


cd $(echo $PWD)/wrd




if [ -e "$path_to_file2" ] &&[ -e "$path_to_file3" ]
then 
pandoc -o old.docx $path_to_file2 $path_to_file3
pandoc -o file.docx  $path_to_file1 $WATCH_DIR/old.docx
rm $path_to_file3
rm $path_to_file2






elif [ -e "$path_to_file2" ] 
then
pandoc -o file.docx $path_to_file1 $path_to_file2

rm $(echo $PWD)/wrd/file.docx

cd ..

elif [ -e "$path_to_file3" ] 
then 
pandoc -o file.docx $path_to_file1 $path_to_file3
rm $(echo $PWD)/wrd/file.docx

cd ..





else :

echo "${RED} error fin de programme"
exit 1



fi 


while true; do


  sleep 5

  
  for file in "$WATCH_DIR"/*.docx; do
    if [ -f "$file" ]; then

     
      echo "Le fichier $file a été détecté, conversion en cours..."

      
      libreoffice --headless --convert-to pdf "$file" --outdir "$WATCH_PDF"

      
      echo "La conversion du fichier $file en PDF est terminée."
		
     
      rm "$file"
      exit 0
    fi
  done
done



else :
	echo "${RED}il n'y à pas de fichier a convertir. \n fin de programme"
	
fi 

echo "fin du programme"
exit 0 














