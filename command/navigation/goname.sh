#! /bin/bash

goname ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]]; then
		cd $ROOT_NAME
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}
