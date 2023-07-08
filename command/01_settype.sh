#! /bin/bash

# Creation des variables
#  - TYPE
#  - ROOT_TYPE








# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   01_settype.sh" "i"
fi
# ======================================================================================================================



settype ()
{
	condition=0

    #  0 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 0 ]]; then
        condition=1
    fi

    #  1 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 1 ]]; then

        path=$ROOT_CHANTIERS/$1

        # si le type n'existe pas :
        if ! [[ -e $path ]]; then
        	echo -e ${GRIS2} ""
            read -p "Le type $1 n'existe pas. Voulez vous le creer ? (o,n) " reponse
			echo -e ${NEUTRE} ""
            if [[ $reponse == "o" ]]; then
                mkdir $path
                TYPE=$1
                condition=0
                echo -e ${NEUTRE} ""
                echo -e "creation du type $ROOT/${JAUNE}$1"
			    echo -e ${NEUTRE} ""
            elif [[ $reponse == "n" ]]; then
                condition=1
            else
                echo "Erreur de saisie, commande annulee. (settype 1) "
                condition=1
            fi
        # si le type existe :
        else
            TYPE=$1
            # si le dernier caractere est "/" on le supprime
            if [[ ${TYPE: -1} == "/" ]]; then
                TYPE=${TYPE:: -1}
            fi
            condition=0
        fi
    fi

    #  trop d' argument :
	#----------------------------------------------------------------------------
    if [[ $# > 1 ]]; then
        echo "Erreur de saisie, commande annulee. (settype 2) "
        condition=1
    fi


    # =============================================
    #  resultat :
    # =============================================

    clear

    if [[ $condition == 0 ]]; then

        export TYPE=$TYPE
        export PROJET=""
        export FOLD=""
        export SOFT=""

        export ROOT_TYPE=$ROOT_CHANTIERS/$TYPE

        lst "TYPE   = ${JAUNE}$TYPE" "Liste de projets de type $TYPE :" $ROOT_CHANTIERS/$TYPE 2

        ps1

        # on se deplace sur le type
        cd $ROOT_TYPE

    else
        if [[ $TYPE == "" ]]; then
            type="3d"
            root_type="$ROOT_CHANTIERS/$TYPE"
        else
            type=$TYPE
            root_type=$ROOT_TYPE
        fi

        export TYPE=$type
        export ROOT_TYPE=$root_type

        cd $ROOT_CHANTIERS
		lst "Racine du pipeline" "Liste des types de projet :" $ROOT_CHANTIERS 2
        ps1
    fi
}

# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  01_settype.sh" "o"
fi
# ======================================================================================================================