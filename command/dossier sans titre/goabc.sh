#! /bin/bash

goabc ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]] && [[ $NAME != "" ]]; then
		if [[ -e $ABC ]]; then
		    cd $ABC
		else
		    mkdir $ABC -p
		    cd $ABC
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}