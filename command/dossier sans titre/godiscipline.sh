#! /bin/bash

godiscipline ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]] && [[ $DISC != "" ]]; then
		cd $ROOT_NAME
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}