#! /bin/bash

goplayblast ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]] && [[ $DISC != "" ]]; then
		if [[ -e $PLAYBLAST ]]; then
		    cd $PLAYBLAST
		else
		    mkdir $PLAYBLAST -p
		    cd $PLAYBLAST
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}