import os

# liste des repertoires du path
def liste_dossier(path):
    """
    :param path: chemin du fichier
    :return: liste des repertoires du path
    """
    liste_dossiers = os.listdir(path)
    liste = []
    for i in liste_dossiers:
        if os.path.isdir(path + '/' + i) == 1:
            liste.append(i)
    return liste

# liste des fichiers du path
def liste_fichier(path):
    """
    :param path: chemin du fichier
    :return: liste des fichiers du path
    """
    liste_fichiers = os.listdir(path)
    liste = []
    for i in liste_fichiers:
        if os.path.isdir(path + '/' + i) == 0:
            liste.append(i)
    return liste

# lire dans un fichier et extraire la valeur de la cle (parm)
# dans le fichier, la cle et la valeur doivent etre separe par un '='
def read_parm(path, parm):
    file = open(path)
    buffer = file.read()
    file.close()

    buffer = buffer.split("\r\n")

    for i in buffer:
        p, v = i.split("=")
        if parm == p:
            find = 1
            val = v
            break
        else:
            find = 0
            val = ''

    return [find, val]

# ajouter cle et valeur dans un fichier
def put_parm(path, parm, value):
    """
    :param path: chemin du fichier
    :param parm: parametre recherche
    :param value: valeur du parametre
    :return: bool si success
    """
    file = open(path)
    buffer = file.read()
    file.close()

    buffer = buffer.split("\r\n")
    new_buffer = ""
    success = 0

    # cherche le paramtre, et lui applique la nouvelle valeur :
    for i in buffer:
        if i != "" and '=' in i:

            p, v = i.split("=")

            if parm != p:
                new_buffer = str(new_buffer + i + "\r\n")
            else:
                new_buffer = str(new_buffer + p + "=" + value + "\r\n")
                success = 1

    # si le parametre n'existe pas dans le fichier, on l'ajoute :
    if success == 0:
        new_buffer = str(new_buffer + parm + "=" + value + "\r\n")
        success = 1

    # enregistrement du buffer dans le fichier :
    if success == 1:
        put_into_file(path, new_buffer)

    return success

# retourne le contenu d'un fichier
def read(path):
    """
    :param path: chemin du fichier
    :return: contenu du fichier (buffer)
    """
    file = open(path)
    buffer = file.read()
    file.close()
    return buffer

# ajouter un buffer dans un fichier
def put_into_file(path, buffer):
    """
    :param path: chemin du fichier
    :param buffer: contenu a ajouter au fichier du path
    """
    file = open(path, 'w')
    file.write(str(buffer))
    file.close()

# creer un fichier
def createFile(path):
    file = open(path,'w')
    file.close()






class fmfile:
    def __init__(self):
        pass

    def put_into_file(self, path, buffer):
        file = open(path, 'w')
        file.write(str(buffer))
        file.close()

    def read(self, path):
        file = open(path)
        buffer = file.read()
        file.close()
        return buffer




