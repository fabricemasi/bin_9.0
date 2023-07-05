#! /bin/bash

goobj ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]]; then
		if [[ -e $OBJ ]]; then
		    cd $OBJ
		else
		    mkdir $OBJ -p
		    cd $OBJ
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}