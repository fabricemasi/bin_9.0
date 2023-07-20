#coding: utf-8
#!/usr/bin/python

import os, sys

path = os.environ['BIN']
condition=True;
omit=['.git', '.idea']
apply=['.sh']
files_to_change = []

for root, folders, files in os.walk(path):
    for i in omit:
        if i in root:
            condition=False

    if condition == True:
        for file in files:
            f = (root+'/'+file).replace('\\','/')
            for ap in apply:
                if ap in f:
                    files_to_change.append(f)
    condition=True

# Resultat

for f in files_to_change:
    command = 'dos2unix '+f
    os.system(command)