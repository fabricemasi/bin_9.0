#!/usr/bin/env bash

# Permet d'afficher des informations si $VERBOSE>0 - Interet : uniformiser les couleurs d'affichage.
# -----------------------------------------------------------------------------------------------
# $1 : "Message a afficher"
# $2 : "i" = IN, "o" = OUT
# $3 : Temps de pause si necessaire (en IN seulement)

debug()
{
    sl=0

    if [[ $2 == "i" ]]; then
        inout="IN"
        couleur=${color2}
        sl=$3
    elif [[ $2 == "o" ]]; then
        inout="OUT"
        couleur=${color2}
    else
        inout=$2
        couleur=${color2}
    fi


    # ---------- v

    if [[ $VERBOSE>0 ]]; then
        echo -e $couleur $1 ... $inout ${NEUTRE}
    fi
    # sleep $sl

}