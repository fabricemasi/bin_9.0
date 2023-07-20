#coding: utf-8
#!/usr/bin/python

import os

BIN = os.environ['BIN']
path_file_IN = BIN + "/data/path_blender_scene_lnx.txt"
path_file_OUT = BIN + "/data/path_blender_scene_win.txt"

file = open(path_file_IN)
buffer = file.read()
file.close()

buffer = buffer.replace("/","\\")

file = open(path_file_OUT, 'w')
file.write(buffer)
file.close()
