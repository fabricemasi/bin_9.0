#coding: utf-8
#!/usr/bin/python

# -------------------------------------------------
# IMPORT
# -------------------------------------------------

import os, sys
from time import sleep

bin = os.environ['BIN']
fm_library=bin+"/library"
sys.path.append(fm_library)

from color import couleur
from file import *


# -------------------------------------------------
# FONCTIONS
# -------------------------------------------------

def tab(chaine, separateur = "", val_tab = 5):
    """
    :param chaine:
    :param separateur: Si on veut un separateur du type "-"
    :param val_tab: Largeur de l'espace en nombre de caracteres (par defaut : 5)
    :return:
    """
    val_tab -= len(str(chaine))
    espace = ""
    for e in range(1, val_tab - 1):
        espace += " "

    if separateur != "":
        espace += separateur + " "

    return espace


# -------------------------------------------------
# SCRIPT
# -------------------------------------------------

path = os.environ['BIN']+'/data'
file_sh = 'pipe_set_history.txt'

os.chdir(path)


# Chargement du fichier ds le buffer :
file = open(file_sh)
buffer = file.read()
file.close()

buffer = buffer.split('\n')


# On suprime les champs vides s'il y en a :
buffer2 = []
for l in buffer:
    if l != "":
        buffer2.append(l)

buffer = []
buffer = buffer2


# On inverse la liste :
buffer.reverse()

# On filtre les elements deja dans la liste :
liste = []
x = 0
for l in buffer:
    l = l.split("-----")
    l = l[1]
    if l not in liste:
        x += 1
        liste.append(l)


# et on reinverse la liste
liste.reverse()


# On affiche la liste
for l in liste:
    couleur('JAUNE')
    print(l)
    couleur('NEUTRE')
