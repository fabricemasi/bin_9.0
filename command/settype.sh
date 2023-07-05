#! /bin/bash

# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   settype.sh" "i"
fi

settype ()
{
	condition=1

    #  0 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 0 ]]; then
        condition=0
    fi

    #  1 argument :
	#----------------------------------------------------------------------------
    if [[ $# == 1 ]]; then

        path=$ROOT_PROJETS/$1

        # si le shot n'existe pas :
        if ! [[ -e $path ]]; then
        	echo -e ${GRIS} ""
            read -p "Le type $1 n'existe pas. Voulez vous le creer ? (o,n) " reponse
			echo -e ${NEUTRE} ""

            if [[ $reponse == "o" ]]; then
                mkdir $path
                TYPE=$1
                condition=1
            elif [[ $reponse == "n" ]]; then
                condition=0
            else
                echo "Erreur de saisie, commande annulee. (settype 3) "
                condition=0
            fi

        # si le shot existe :
        else
            TYPE=$1
            # si le dernier caractere est "/" on le supprime
            if [[ ${TYPE: -1} == "/" ]]; then
                TYPE=${TYPE:: -1}
            fi
            condition=1
        fi
    fi

    #  trop d' argument :
	#----------------------------------------------------------------------------
    if [[ $# > 1 ]]; then
        echo "Erreur de saisie, commande annulee. (settype 4) "
        condition=0
    fi


    # =============================================
    #  resultat :
    # =============================================

    clear

    if [[ $condition == 1 ]]; then

        export TYPE=$TYPE
        export NAME=""
        export SOFT=""

        lst "TYPE = $TYPE \n NAME :" $ROOT_PROJETS/$TYPE 1

        ps1

        # on se deplace sur le type
        cd $ROOT_TYPE

        # on continue si l'argument discipline existe deja
        if [[ $# == 2 ]]; then
            setname $2
        fi
        if [[ $# == 3 ]]; then
            setname $2 $3
        fi

    else
        export TYPE=""
        cd $ROOT_PROJETS
		lst "TYPE : " $ROOT_PROJETS 1
        ps1
    fi
}

# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  settype.sh" "o"
fi