#! /bin/bash

gocache ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]] && [[ $DISC != "" ]]; then
		if [[ -e $CACHE ]]; then
		    cd $CACHE
		else
		    mkdir $CACHE -p
		    cd $CACHE
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}