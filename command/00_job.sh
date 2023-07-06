#! /bin/bash

# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   job.sh" "i"
fi

job ()
{

	# RUN sans argument :
	if [[ $# == 0 ]]; then
		setname
	fi
	
	# RUN 1 argument :
	if [[ $# == 1 ]]; then
		if [[ $1 == "-h" ]]; then
            python "$BIN/tools/pipe_set_history_filtre.py"
		elif [[ $1 == "-ha" ]]; then
			cat "$BIN/data/pipe_set_history.txt"
		elif [[ $1 == "-ah" ]]; then
			cat "$BIN/data/pipe_set_history.txt"
		else
			setname $1
		fi
	fi

	# RUN 2 arguments :
	if [[ $# == 2 ]]; then
		settype $1
		setname $2
	fi


	# Trop d'arguments :
	if [[ $# > 2 ]]; then
		echo -e ${ROUGE}"Erreur : "${NEUTRE}"Trop d'arguments..."
	fi


}

cutslash ()
{
    saisie=$1
    saisie_long=${#1}
	liste_param=''
    n=0
    declare -A liste_param
    declare -A return
    for (( i = 0; i < ${saisie_long}; ++i )); do
        lettre=${1:i:1}
        if [[ $lettre != "/" ]]; then
            liste_param[$n]=${liste_param[$n]}$lettre
        else
            let "n=$n+1"
        fi
    done


    #RESULTAT:
    arg1=${liste_param[0]}
    arg2=${liste_param[1]}
    arg3=${liste_param[2]}
    arg4=${liste_param[3]}
}


jj ()
{
 	# RUN sans argument :
	if [[ $# == 0 ]]; then
		settype
	fi

	if [[ $# == 1 ]]; then
	    cutslash $1
	    job $arg1 $arg2
	fi

	# Trop d'arguments :
	if [[ $# > 1 ]]; then
		echo -e ${ROUGE}"Erreur : "${NEUTRE}"Trop d'arguments... (jj)"
	fi
}


test1 () # source tous les fichiers du repertoire command
{
    cd $BIN/command
    test=`ls`

    for i in $test ; do
        source $BIN/command/$i
        echo -e "|  ${i::-3}"
    done

}



# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   job.sh" "o"
fi