import tkinter as tk
import subprocess
import os
from PIL import Image, ImageTk

# Récupération du chemin absolu du dossier courant
current_dir = os.getcwd()

# Chemin relatif vers le dossier contenant l'image
image_dir = "images"

# Nom de l'image
image_name = "image.png"

# Chemin absolu vers l'image
image_path = os.path.join(current_dir, image_dir, image_name)

# Création de la fenêtre Tkinter
root = tk.Tk()

# Chargement de l'image
image = Image.open(image_path)

# Conversion de l'image en un format compatible avec Tkinter
tk_image = ImageTk.PhotoImage(image)

# Création du widget Image
image_widget = tk.Label(root, image=tk_image)

# Placement du widget Image dans la fenêtre
image_widget.pack()

def autoNmap():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './autonmap.sh; read'])  


def autoDDOs():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './ddos.sh; read'])
    
def TrojanSimulator():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './TrojanSimulator.sh; read'])

def AutoPDF():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './autoPDF.sh; read'])
 
def EnvoiPDF():
    subprocess.Popen(['gnome-terminal','-x', 'bash', '-c', './envoiPDF.sh; read'])  

btn1 = tk.Button(
    root, 
    text="autonmap",
    activeforeground="red",
    activebackground="black",
    padx=8,
    pady=5,
    command=autoNmap
)

btn2 = tk.Button(
    root, 
    text="DDOSSimulator",
    activeforeground="red",
    activebackground="black",
    padx=8,
    pady=5,
    command=autoDDOs
)

btn3 = tk.Button(
    root, 
    text="TrojanSimulator",
    activeforeground="red",
    activebackground="black",
    padx=8,
    pady=5,
    command=TrojanSimulator
)

btn4 = tk.Button(
    root, 
    text="Convertisseur PDF",
    activeforeground="white",
    activebackground="black",
    padx=8,
    pady=5,
    command=AutoPDF
)

btn5 = tk.Button(
    root, 
    text="envoyer le rapport ",
    activeforeground="white",
    activebackground="black",
    padx=8,
    pady=5,
    command=EnvoiPDF
)

btn1.pack(side=tk.LEFT)
btn2.pack(side=tk.LEFT)
btn3.pack(side=tk.LEFT)
btn4.pack(side=tk.RIGHT)
btn5.pack(side=tk.RIGHT)

root.mainloop()
