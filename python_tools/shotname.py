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
# SCRIPT
# -------------------------------------------------

fichierData = bin+"/data/shotname.txt"

SHOT = os.environ['SHOT']

SHOT = SHOT.split('/')
SHOTNAME = SHOT[1]
os.environ['SHOTNAME'] = SHOTNAME
put_into_file(fichierData, SHOTNAME)
