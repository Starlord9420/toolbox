# toolbox
rappel le boite  à outils  est compatible sur  Kali  linux 2023.2  à voir  avec les autre  distribution s kali-linux




présentation  des différents script et leur s usages :

Avant toute premiére chose pour lancer  notre toolbox nous allons dans le répertore "toolbox"  et nous  tapos la commande suivante  "python3 start.py".

Pour le script start.py : 

 le script crée une fenêtre Tkinter qui affiche une image et contient plusieurs boutons. Chaque bouton est associé à une fonction qui exécute une action spécifique lorsque le bouton est cliqué. Cela permet à l'utilisateur d'interagir avec l'interface graphique et d'effectuer certaines actions telles que lancer des scripts dans des terminaux gnome-terminal.
 
 Les modules nécessaires sont importés : tkinter, subprocess, os et PIL.ImageTk.

Le chemin absolu du dossier courant est récupéré à l'aide de os.getcwd().

Le nom et le chemin relatif de l'image sont définis.

Le chemin absolu de l'image est créé en utilisant os.path.join().

Une fenêtre Tkinter est créée avec tk.Tk().

L'image est chargée à l'aide de Image.open().

L'image est convertie en un format compatible avec Tkinter à l'aide de ImageTk.PhotoImage().

Un widget d'image est créé avec tk.Label() et l'image convertie est assignée à ce widget.

Le widget d'image est placé dans la fenêtre avec pack().

Plusieurs fonctions sont définies pour effectuer des actions spécifiques lorsque les boutons sont cliqués.

Des boutons sont créés avec tk.Button() et les fonctions correspondantes sont assignées à chaque bouton.

Les boutons sont positionnés dans la fenêtre avec pack().

La boucle principale de l'interface graphique est exécutée avec root.mainloop().

Voicie le résul obtenue e : 




![Capture-interface](https://github.com/Starlord9420/toolbox/assets/122219027/1e48c354-c3ff-4855-af9a-a4f50b4b2a42)


Pour le script Autonmap


le script permet à l'utilisateur de lancer différents types de scans de réseau à l'aide de Nmap en fonction de ses choix. Les résultats des scans sont enregistrés dans un fichier texte pour une utilisation avec le script de conversion pdf pour importer les résultat obtenue dans le fichier pdf en question.

voici une expliquation détailler du script  : 
Le script commence par définir des variables de couleur pour les messages d'affichage.

Une vérification est effectuée pour savoir si Nmap est déjà installé sur le système. Si Nmap n'est pas installé, le script met à jour le système et installe Nmap à l'aide de la commande apt-get.

L'utilisateur est invité à entrer une adresse cible et les ports ciblés.

Une liste d'options est affichée à l'utilisateur pour choisir le type de scan à effectuer.

L'utilisateur choisit une option et en fonction de son choix, le script exécute la commande correspondante avec Nmap. Les résultats du scan sont redirigés vers un fichier texte.

Le contenu du fichier texte est ensuite modifié en ajoutant une ligne vide après chaque ligne avec la commande sed.

À la fin du script, un message est affiché pour indiquer la fin du programme.

voici une vidéo  qui montre  un tst dit  "standard": 





https://github.com/Starlord9420/toolbox/assets/122219027/05638967-0ba7-4622-a82c-069c58db540c



Pour le script Ddos.sh :  

le script utilise l'outil Slowloris pour mener une attaque de déni de service sur un serveur cible. Il vérifie si les dépendances requises sont installées, télécharge le fichier Slowloris si nécessaire, lance l'attaque avec les paramètres spécifiés par l'utilisateur, enregistre le résultat dans un fichier texte qui sera utiliser plus tard par le script  de conversion PDF.

voici le détai du script : 

Le script commence par définir des variables de couleur pour les messages d'affichage.

Un logo ASCII est affiché à l'utilisateur.

Une vérification est effectuée pour savoir si Git est installé sur le système. Si Git n'est pas installé, le script l'installe à l'aide de la commande apt.

Le script vérifie si le fichier "slowloris-master" existe dans le répertoire. S'il existe, le script passe à l'étape suivante. Sinon, il télécharge le fichier "slowloris-master" à partir de GitHub et le décompresse.

L'utilisateur est invité à entrer le FQDN (Fully Qualified Domain Name) de la cible, le nombre de paquets à envoyer et le timeout.

Le script exécute la commande ./slowloris.py "$cible" -s "$paquet" pour lancer l'attaque Slowloris sur la cible. Le processus de l'attaque est mis en arrière-plan, et son identifiant de processus (PID) est enregistré.

Le script attend pendant la durée spécifiée par le timeout.

Ensuite, le script vérifie si des connexions sont établies vers le port 80 de la cible en utilisant la commande netstat. Si des connexions sont trouvées, cela signifie que l'attaque a réussi, sinon, l'attaque a échoué.

Le résultat de l'attaque (réussite ou échec) est enregistré dans un fichier texte.

Le processus de l'attaque est tué en utilisant le PID enregistré précédemment.

Un message de fin de programme est affiché.

ci -dessous une capture vidéos de test concernant le script  ddos.sh :



https://github.com/Starlord9420/toolbox/assets/122219027/650d5913-389a-4eed-ac6b-95060d296e22



Pour le script  TrojanSimulator.sh
Ce script shell génère un malware Trojan en  utilisant l'outil msfvenom  si l'utilisateur ne posséde pas de serveur apache ce dernier va l'installer  et ensuite il lancera une fenétre  Metasploit.

voici le détaille du  script  :

Les premières lignes du script définissent des variables pour les couleurs utilisées dans les messages affichés à l'écran.

Ensuite, il affiche un texte d'accueil et demande à l'utilisateur s'il possède un serveur Apache. La réponse de l'utilisateur est enregistrée dans la variable SrvApache.

Selon la réponse de l'utilisateur, le script installe Apache si nécessaire ou démarre le serveur Apache existant.

Ensuite, le script demande à l'utilisateur s'il a un malware exécutable. La réponse de l'utilisateur est enregistrée dans la variable execute.

Si l'utilisateur n'a pas de malware exécutable, le script lui demande de choisir le système d'exploitation de la cible (Linux ou Windows).

Selon le choix de l'utilisateur, le script lui demande le nom du malware et d'autres informations telles que l'adresse IP du serveur pirate et le port d'écoute souhaité.

Ensuite, le script utilise l'outil msfvenom pour générer le malware en fonction des informations fournies. Le malware est ensuite déplacé vers le répertoire /var/www/html/share pour être accessible via le serveur Apache.

Enfin, le script demande à l'utilisateur s'il souhaite lancer le malware via msfconsole, un outil de pénétration de Metasploit Framework. Selon la réponse de l'utilisateur, msfconsole est lancé avec les paramètres appropriés pour écouter les connexions entrantes du malware.

Le script se termine après avoir effectué les actions nécessaires.
 Ci dessous une capture vidéos de l'utilisation du scipt : 
 
 


https://github.com/Starlord9420/toolbox/assets/122219027/3832e253-d2a3-492a-ad0b-52722558da8f


Pour le  script  AutoPDF.sh

Ce dernier va  convert les résultat  des fichier txt en fichier word qui va ensuite etre reconvertie en pdf avec le template qui est joins a la  "toolbox"

le détaille  du script  : 
Vérifie si Pandoc (un outil de conversion de documents) est installé. Si ce n'est pas le cas, il l'installe.

Vérifie si LibreOffice (une suite bureautique) est installé. Si ce n'est pas le cas, il demande à l'utilisateur s'il souhaite l'installer et procède à son installation si l'utilisateur accepte.

Convertit deux fichiers Markdown en fichiers DOCX à l'aide de Pandoc.

Extrait le contenu des fichiers DOCX convertis.

Définit des variables de chemin vers certains fichiers.

Vérifie l'existence de certains fichiers et effectue des opérations de conversion supplémentaires en fonction de leur présence.

Surveille en permanence un répertoire spécifié pour les fichiers DOCX.

Lorsqu'un fichier DOCX est détecté, le script utilise LibreOffice pour le convertir en PDF et le déplace dans un répertoire spécifié.

Supprime le fichier DOCX d'origine après la conversion.

Le script continue de surveiller le répertoire pour d'autres fichiers DOCX et effectue les conversions correspondantes.

Si aucun fichier DOCX n'est trouvé initialement, le script affiche un message et se termine.

Ci-dessous  une capture  une videos  du  script: 



https://github.com/Starlord9420/toolbox/assets/122219027/2e30a64a-aee6-4b9c-8b6d-50af3674a24f



pour le  script  EnvoiPDF.sh
 ce script shell permet de configurer et d'envoyer un rapport par e-mail en utilisant ssmtp et mutt. Il guide l'utilisateur pour la configuration et effectue les vérifications nécessaires avant l'envoi de l'e-mail.
 
 le détaille  du  script  : 
 
 Configuration des codes de couleur pour l'affichage.
Vérification de l'installation des programmes ssmtp et mutt. S'ils ne sont pas installés, le script les installe automatiquement.
Demande à l'utilisateur s'il a configuré le service ssmtp. Si la réponse est non, le script guide l'utilisateur pour la configuration en demandant différentes informations (e-mail, serveur, port, mot de passe, hostname) et en écrivant ces informations dans le fichier de configuration ssmtp.conf.
Demande à l'utilisateur de renseigner le destinataire de l'e-mail.
Définition de l'objet et du corps de l'e-mail.
Vérification de l'existence du fichier PDF à envoyer.
Si le fichier PDF existe, le script procède à l'envoi de l'e-mail en utilisant mutt avec l'objet, le corps et la pièce jointe spécifiés.
Si le fichier PDF n'existe pas, le script affiche un message d'erreur et se termine.
Affichage d'un message de fin du programme.

Voicie une  capture  vidéos  du  script : 




https://github.com/Starlord9420/toolbox/assets/122219027/63647201-a083-4d4b-8474-30aade8c1ebd



Une fois  bien configurer  nous  pouvons  envoyer des mails    sous le format  suivant  :


![Capture-envoi-pdf](https://github.com/Starlord9420/toolbox/assets/122219027/b44d9d08-bdcc-414e-b244-d603c08e38a9)




.




