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
                type=$1
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
            type=$1
            # si le dernier caractere est "/" on le supprime
            if [[ ${type: -1} == "/" ]]; then
                type=${type:: -1}
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
        export TYPE=$type
        export ROOT_TYPE=$ROOT_CHANTIERS/$TYPE

        cd $ROOT_TYPE
        lst     "TYPE   = ${JAUNE}$type"   "Liste de projets de type $type :"   $ROOT_CHANTIERS/$TYPE   1   ${COLOR4}${GRAS}"Vous devez setter un projet : 'setprojet' ou 'p'"

        # Lance la commande setprojet si il n'y a qu'un seul folder
        nb_folder=`ls -l | grep ^d |wc -l`
        if [[ $nb_folder == 1 ]]; then
            folder=`ls`
            setprojet $folder
        fi

    elif [[ $condition == 1 ]]; then
        if  [[ $TYPE == "" ]]; then
            export TYPE="3d"
            export ROOT_TYPE=$ROOT_CHANTIERS/$TYPE
        else
            export TYPE=$TYPE
            export ROOT_TYPE=$ROOT_CHANTIERS/$TYPE
        fi

        cd $ROOT_CHANTIERS
		lst     "Racine du pipeline"   "Liste des types de projet :"   $ROOT_CHANTIERS   1   ${COLOR4}${GRAS}"Vous devez setter un projet : 'setprojet' ou 'p'"
    fi

    ps1
}

# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  01_settype.sh" "o"
fi
# ======================================================================================================================