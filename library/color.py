#coding: utf-8
#!/usr/bin/python

import os
import sys

test=os.environ['TEST']

colours = {
    "DEFAULT"    :    "\033[0m",
    "NEUTRE"     :    "\033[0m",
    # style
    "bold"       :    "\033[1m",
    "underline"  :    "\033[4m",
    "blink"      :    "\033[5m",
    "reverse"    :    "\033[7m",
    "concealed"  :    "\033[8m",
    # couleur texte
    "NOIR"       :    "\033[30m",
    "ROUGE"      :    "\033[31m",
    "VERT"       :    "\033[32m",
    "JAUNE"      :    "\033[33m",
    "BLEU"       :    "\033[34m",
    "MAGENTA"    :    "\033[35m",
    "CYAN"       :    "\033[36m",
    "BLANC"      :    "\033[37m",
    # couleur fond

    "TEST"       :    "\033[38m",

    "on_black"   :    "\033[40m",
    "on_red"     :    "\033[41m",
    "on_green"   :    "\033[42m",
    "on_yellow"  :    "\033[43m",
    "on_blue"    :    "\033[44m",
    "on_magenta" :    "\033[45m",
    "on_cyan"    :    "\033[46m",
    "on_white"   :    "\033[47m" }



def couleur(nom):
    # on évite print à cause du '\n' inséré automatiquement
    sys.stdout.write(colours[nom])
