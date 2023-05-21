# toolbox
rappel le boite  à outils  est compatible sur  "...."




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







