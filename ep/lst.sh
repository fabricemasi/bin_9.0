#! /bin/bash

# Arguments :   1 : msg 1 = renseignement sur les variables de set deja crees
#               2 : msg 2 = renseignement sur ce qu'est la liste affichee
#               3 : path ou se positionner
#               4 : nombre d'indentations pour tree
#               5 : msg 3 = Message de sortie


lst ()
{
	msg1=$1
	msg2=$2
	path=$3
	indent=$4
	msg3=$5

    color1=${BLEU}
    color2=${BLEU}${GRAS}


	cd $path

    echo -e $color1"======================================================="
	echo -e $color2' '$msg1
    echo -e $color1"-------------------------------------------------------"
    echo -e $color2' '$msg2
    echo ""
	tre $indent
	echo ""
    echo -e $color1"======================================================="
	echo ""
	echo -e ${COLOR4}$msg3${NEUTRE}
}