#! /bin/bash

goref ()
{
	if [[ $PROJ != "" ]]; then
		if [[ -e $REF ]]; then
		    cd $REF
		else
		    mkdir $REF -p
		    cd $REF
		fi
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}