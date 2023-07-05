#! /bin/bash

gopublish ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]]; then
		if [[ -e $PUBLISH ]]; then
		    cd $PUBLISH
		else
		    mkdir $PUBLISH -p
		    cd $PUBLISH
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}