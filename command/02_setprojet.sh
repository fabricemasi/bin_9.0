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
	condition=0

    #  0 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 0 ]]; then
        if [[ $TYPE == "" ]]; then
            settype 3d
            setprojet
	    elif [[ $TYPE != "" ]]; then
	        condition=1
	        export PROJET=""
	        export FOLDER=""
	        export SOFT=""
	        export ROOT_PROJET=""
	        export ROOT_FOLDER=""
	        export ROOT_SOFT=""
	    fi
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
                PROJET=$1
                condition=0
                echo -e ${NEUTRE} ""
                echo -e "creation du projet $ROOT/${JAUNE}$1"
			    echo -e ${NEUTRE} ""
            elif [[ $reponse == "n" ]]; then
                condition=1
            else
                echo "Erreur de saisie, commande annulee. (setprojet 1) "
                condition=1
            fi
        # si le type existe :
        else
            PROJET=$1
            # si le dernier caractere est "/" on le supprime
            if [[ ${PROJET: -1} == "/" ]]; then
                PROJET=${PROJET:: -1}
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

        export TYPE=$TYPE
        export PROJET=$PROJET
        export FOLDER=""
        export SOFT=""

        export ROOT_PROJET=$ROOT_TYPE/$PROJET

        lst "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET" "Liste des repertoires pour le projet ${COLOR3}$PROJET${COLOR0} :" $ROOT_PROJET 1 ${COLOR4}${GRAS}"Vous devez setter un sous-repertoire (sub) : 'setsub' ou 's3'"

        ps1

        # on se deplace sur le projet
        cd $ROOT_PROJET

    elif [[ $condition == 1 ]]; then
        cd $ROOT_TYPE
		lst "TYPE   = ${COLOR4}$TYPE${COLOR0}" "Liste de projets de type $TYPE :" $ROOT_TYPE 1 ${COLOR4}${GRAS}"Vous devez setter un projet : 'setprojet' ou 's2'"
		ps1
    fi
}

# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  02_setprojet.sh" "o"
fi
# ======================================================================================================================