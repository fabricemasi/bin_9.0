#! /bin/bash

# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   03_setfolder.sh" "i"
fi
# ======================================================================================================================


setfolder ()
{
    export FOLDER=""
	export SOFT=""

	export ROOT_FOLDER=""
	export ROOT_SOFT=""

	condition=0
    msg=""

	#  0 argument :
	#----------------------------------------------------------------------------
	if [[ $# == 0 ]]; then
	    if [[ $TYPE == "" ]] && [[ $PROJET == "" ]]; then
	        msg="${COLOR4}${GRAS}Aucun type ni projet n'a encore ete sette. Utilisez les commandes 'settype' et 'setprojet'."
	        condition=2
	    elif [[ $TYPE != "" ]] && [[ $PROJET == "" ]]; then
	        msg="${COLOR4}${GRAS}Aucun projet n'a ete sette. Utilisez la commande 'setprojet'."
	        condition=2
	    elif [[ $TYPE != "" ]] && [[ $PROJET != "" ]]; then
	        condition=1
	    fi
	fi

	#  1 argument :
	#----------------------------------------------------------------------------
	if [[ $# == 1 ]]; then

		path=$ROOT_PROJET/$1

		# si le projet n'existe pas :
		if ! [[ -e $path ]]; then
			echo -e ${COLOR4} ""
			read -p "Le sous-repertoire $1 n'existe pas. Voulez vous le créer ? (o,n) " reponse
			echo -e ${NEUTRE} ""

			if [[ $reponse == "o" ]]; then
				mkdir $path
				mkdir $path/01_ref
				mkdir $path/02_work
				mkdir $path/03_temp
				mkdir $path/04_publish
				mkdir $path/05_final
				msg="Espace de travail cree."
				condition=0

			elif [[ $reponse == "n" ]]; then
                msg="Commande annulee."
                condition=1

			else
				msg="Erreur de saisie, commande annulee. (setfolder_1)."
				condition=1

			fi
		# si le sous-repertoire existe :
		else
			condition=0
		fi
	fi

	#  trop d'argument :
	#----------------------------------------------------------------------------
	if [[ $# > 1 ]]; then
	    msg "Erreur de saisie (trop d'arguments), commande annulee. (setfolder_2)."
	    condition=1

	fi










	# =============================================
	#  resultat :
	# =============================================

    clear

	if [[ $condition == 0 ]]; then
		folder=$1
		if [[ ${folder: -1} == "/" ]]; then
			 	folder=${folder:: -1}
		fi



		export FOLDER=$folder
		export ROOT_FOLDER=$ROOT_PROJET/$folder



#        export REF=$ROOT_PIPE/projets/$TYPE/$NAME/01_ref
#		 export WORK=$ROOT_PIPE/projets/$TYPE/$NAME/02_work
#        export TEMP=$ROOT_PIPE/projets/$TYPE/$NAME/03_temp
#        export PUBLISH=$ROOT_PIPE/projets/$TYPE/$NAME/04_publish
#        export FINAL=$ROOT_PIPE/projets/$TYPE/$NAME/05_final
#
#        if [[ $SYSTEM == "windows" ]]; then
#            echo "Systeme detecte : WINDOWS"
#            echo "  -> Correction de la variable d'environnement 'PUBLISH'"
#            publish_w=""$ROOT_PIPE_W"\\projets\\"$TYPE"\\"$NAME"\\04_publish"
#            /mnt/c/Windows/System32/reg.exe add "HKCU\Environment" /v PUBLISH /t REG_SZ /d $publish_w /f
#        fi
#
#
#

        echo "#!/bin/bash" > $BIN/data/pipe_set.sh
        echo "export TYPE='"$TYPE"'" >> $BIN/data/pipe_set.sh
        echo "export PROJET='"$PROJET"'" >> $BIN/data/pipe_set.sh
        echo "export FOLDER='"$FOLDER"'" >> $BIN/data/pipe_set.sh

        dt=`date +%F"--"%T`

        echo $dt-----job $TYPE $PROJET $FOLDER >> $BIN/data/pipe_set_history.txt
        echo -e ${BLEU}${GRAS}
        echo -e "Enregistrement des donnees de set OK."
        echo -e ${NEUTRE}
        lst     "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET${COLOR0} \n FOLDER..... ${COLOR3}$FOLDER"   "Liste des espaces de travail pour le projet ${COLOR3}$PROJET${COLOR0}${GRAS} / ${COLOR3}$FOLDER${COLOR0}${GRAS} :"   $ROOT_FOLDER/02_work   1   ${COLOR4}${GRAS}"Vous devez setter un software"

        cd $ROOT_FOLDER

        ps1

	elif [[ $condition == 1 ]]; then
        cd $ROOT_PROJET
        cl
        lst     "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET"   "Liste des repertoires pour le projet ${COLOR3}$PROJET${COLOR0} :"   $ROOT_PROJET   1   ${COLOR4}${GRAS}"Vous devez setter un sous-repertoire (folder) : 'setfolder' ou 's3'"

        echo ""
        echo $msg

		ps1
	elif [[ $condition == 2 ]]; then
        cd $ROOT_PROJET

        echo ""
        echo -e ${COLOR6}${GRAS}$msg${NEUTRE}
		ps1
	fi
}




# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   02_setfolder.sh" "o"
fi
# ======================================================================================================================




