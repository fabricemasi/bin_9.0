#! /bin/bash

gorender ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]] && [[ $DISC != "" ]]; then
		if [[ -e $RENDER ]]; then
		    cd $RENDER
		else
		    mkdir $RENDER -p
		    cd $RENDER
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}