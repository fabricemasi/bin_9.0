#coding: utf-8
#!/usr/bin/python

# SPLIT UNE CHAINE DE CHARACTERES PAR LE /



import sys,os
from api import *

BIN = os.environ["BIN"]

arg = sys.argv[1]
if arg[-1]=="/":
    arg=arg[:-1]
arg = arg.split("/")




chaine=[]
n=0
for a in arg:
    n = n + 1
    chaine.append(a)



# RETURN :
#=========
fill_return_nb(n)
if n>0:
    fill_return1(chaine[0])

if n>1:
    fill_return2(chaine[1])

if n>2:
    fill_return3(chaine[2])

if n>3:
    fill_return4(chaine[3])

if n>4:
    fill_return5(chaine[4])
