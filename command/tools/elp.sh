#!/usr/bin/env bash



elp ()
{
    echo -e $ROUGE
    echo ". ===================="
    echo ". HELP $BINV"
    echo ". ===================="
    echo -e $STANDARD

    echo "."

    echo -e $BLANC
    echo ". -----------"
    echo ". COMMANDES :"
    echo ". -----------"
    echo -e $STANDARD

    echo ". GENERALES :"
    echo ". extract ....................... Extraire des fichiers compresses"
    echo ". killpipe ...................... Reinitialise les variables du pipe"
    echo "."


    echo -e $BLANC
    echo ". --------"
    echo ".  TRICS :"
    echo ". --------"
    echo -e $STANDARD
    echo ". Sublime : Replier tout : ...... Ctrl k 1 "
    echo ". Utiliser la couleur : ......... echo -e \$BLANC"



    echo -e $BLANC
    echo ". -----------"
    echo ". VARIABLES :"
    echo ". -----------"
    echo -e $STANDARD
    echo ". extract ....................... Extraire des fichiers compresses"
    echo -e $BLANC
    echo ". -----------"
    echo ". RAPPEL    :"
    echo ". -----------"
    echo "."
    echo ". ROOT_PIPE / projets / TYPE / NAME / "
    echo "."
    echo -e $STANDARD
    echo "."
    echo -e ". BINV .......................... $BINV ${GRIS} (bashrc) ${NEUTRE}"
    echo -e ". BIN ........................... $BIN ${GRIS} (bashrc) ${NEUTRE}"
    echo "."
    echo -e ". VERBOSE ...................... $VERBOSE ${GRIS} (init_01) ${NEUTRE}"
    echo "."
    echo ". TYPE .......................... $TYPE"
    echo ". NAME .......................... $NAME"
    echo ". SOFT .......................... $SOFT"
    echo "."
    echo ". ROOT :"
    echo ". ------"
    echo -e ". ROOT_PIPE ..................... $ROOT_PIPE ${GRIS} (init_03) ${NEUTRE}"
    echo -e ". ROOT_PROJET................... $ROOT_PROJET ${GRIS} (init_03) ${NEUTRE}"
    echo -e ". ROOT_TEMP ..................... $ROOT_TEMP ${GRIS} (init_03) ${NEUTRE}"
    echo "."
    echo "."
    echo ". PATH :"
    echo ". ------"
    echo ". CACHE  : ...................... $CACHE"
    echo ". RENDER : ...................... $RENDER"
    echo "."
    echo ". -----------"
    echo ". LOGICIELS :"
    echo ". -----------"
    echo -e "${CYAN} $LISTE_SOFTS"
    echo -e $BLANC"\nReste a installer :"
    echo -e "${ROUGE} $LISTE_SOFTS_A_INSTALL"
}