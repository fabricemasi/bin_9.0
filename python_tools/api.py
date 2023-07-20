#coding: utf-8
#!/usr/bin/python

import os
BIN = os.environ["BIN"]

def fill_return_nb(buffer):
    path = BIN + "/data"
    file = "return_nb.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def fill_return1(buffer):
    path = BIN + "/data"
    file = "return1.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def fill_return2(buffer):
    path = BIN + "/data"
    file = "return2.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def fill_return3(buffer):
    path = BIN + "/data"
    file = "return3.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def fill_return4(buffer):
    path = BIN + "/data"
    file = "return4.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def fill_return5(buffer):
    path = BIN + "/data"
    file = "return5.txt"

    file = open(path + "/" + file, "w")
    file.write(str(buffer))
    file.close()

def essai():
    print("Ca marche!!")