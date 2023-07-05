#! /bin/bash

goprojet ()
{
	if [[ $PROJ != "" ]]; then
		cd $ROOT_PROJ
	else
		echo "ABORTED. Vous n'etes pas sette correctement."
	fi
}