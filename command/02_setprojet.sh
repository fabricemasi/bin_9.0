#! /bin/bash

# Creation des variables
#  - TYPE
#  - ROOT_TYPE








# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   02_setprojet.sh" "i"
fi
# ======================================================================================================================



setprojet ()
{
    export PROJET=""
    export FOLDER=""
    export SOFT=""

    export ROOT_PROJET=""
    export ROOT_FOLDER=""
    export ROOT_SOFT=""

	condition=0

    #  0 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 0 ]]; then
        export PROJET=""
        export FOLDER=""
        export ROOT_PROJET=""
        export ROOT_FOLDER=""

	    condition=1
    fi

    #  1 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 1 ]]; then

        path=$ROOT_TYPE/$1

        # si le type n'existe pas :
        if ! [[ -e $path ]]; then
        	echo -e ${GRIS2} ""
            read -p "Le projet $1 n'existe pas. Voulez vous le creer ? (o,n) " reponse
			echo -e ${NEUTRE} ""
            if [[ $reponse == "o" ]]; then
                mkdir $path
                projet=$1
			    condition=0
            elif [[ $reponse == "n" ]]; then
                condition=1
            else
                echo "Erreur de saisie, commande annulee. (setprojet 1) "
                condition=1
            fi
        # si le type existe :
        else
            projet=$1
            # si le dernier caractere est "/" on le supprime
            if [[ ${projet: -1} == "/" ]]; then
                projet=${projet:: -1}
            fi
            condition=0
        fi
    fi

    #  2 arguments :
	#----------------------------------------------------------------------------
    if [[ $# == 2 ]]; then
        settype $1
        setprojet $2
    fi

    #  trop d' argument :
	#----------------------------------------------------------------------------
    if [[ $# > 2 ]]; then
        echo "Erreur de saisie, commande annulee. (setprojet 2) "
        condition=1
    fi










    # =============================================
    #  resultat :
    # =============================================

    clear

    if [[ $condition == 0 ]]; then

        export PROJET=$projet
        export ROOT_PROJET=$ROOT_TYPE/$PROJET



        go=$ROOT_PROJET
        lst     "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET"   "Liste des repertoires pour le projet ${COLOR3}$PROJET${COLOR0} :"   $ROOT_PROJET   1   ${COLOR4}${GRAS}"Vous devez setter un sous-repertoire (folder) : 'setfolder' ou 's'"

        # Lance la commande setfolder si il n'y a qu'un seul folder
        nb_folder=`ls -l | grep ^d |wc -l`
        if [[ $nb_folder == 1 ]]; then
            folder=`ls`
            setfolder $folder
        fi

    elif [[ $condition == 1 ]]; then
        export PROJET=""
        export ROOT_PROJET=""

        go=$ROOT_TYPE
		lst     "TYPE   = ${COLOR4}$TYPE${COLOR0}"   "Liste de projets de type $TYPE :"   $ROOT_TYPE   1   ${COLOR4}${GRAS}"Vous devez setter un projet : 'setprojet' ou 'p'"
    fi

    cd $go
    ps1




}

# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  02_setprojet.sh" "o"
fi
# ======================================================================================================================