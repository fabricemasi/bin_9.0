#coding: utf-8
#!/usr/bin/python

import os

BIN = os.environ['BIN']
BLENDER_VERSION = os.environ['BLENDER_VERSION']
print("Blender version : "+BLENDER_VERSION)
file = open(BIN + "/data/path_blender_scene_win.txt")
buffer = file.read().split("\n")[0]
file.close()

path_config_files="c:/Users/fabrice/AppData/Roaming/Blender Foundation/Blender/"+BLENDER_VERSION+"/config"
path_blender_scene=buffer

os.chdir(path_config_files)

buffer = "[Bookmarks]"
buffer = buffer+"\n"+path_blender_scene
buffer = buffer+"\n"+"[Recent]"

file = open(path_config_files+"/bookmarks.txt", 'w')
file.write(buffer)
file.close()
