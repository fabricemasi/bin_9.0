#! /bin/bash

gotype ()
{
	if [[ $PROJ != "" ]] && [[ $TYPE != "" ]]; then
		cd $ROOT_TYPE
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}