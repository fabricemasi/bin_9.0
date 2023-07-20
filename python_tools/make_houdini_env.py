#coding: utf-8
#!/usr/bin/python

import os

SYSTEM = os.environ['SYSTEM']
ROOT = os.environ['ROOT']
HOUDINI_VERSION = os.environ['HOUDINI_VERSION']
HOUDINI_V = os.environ['HOUDINI_V']



if SYSTEM == "linux":
    path = '/mnt/c/Users/fabri/OneDrive/Documents/houdini'+HOUDINI_V
elif SYSTEM == "mac":
    path = '/Users/Shared/houdini/'+HOUDINI_V

file = "houdini.env"

buffer = ""

buffer += "# Generation du fichier houdini.env par bin9.0\n"
buffer += "# --------------------------------------------\n"
buffer += "\n"
buffer += "# Variables houdini :\n"
buffer += "HOUDINI_MULTITHREADED_COOKING = 1\n"
buffer += "\n"
buffer += "# Variables bin6.0 :\n"
buffer += "CACHE = "+os.environ['CACHE']+"\n"
buffer += "RENDER = "+os.environ['RENDER']+"\n"
# buffer += "PLAYBLAST = "+os.environ['PLAYBLAST_FOR_WIN']+"\n"

file = open(path+"/"+file, "w")
file.write(str(buffer))
file.close()

