#! /bin/bash

# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   03_setfolder.sh" "i"
fi
# ======================================================================================================================


setfolder ()
{

	condition=0
    msg=""

	#  0 argument :
	#----------------------------------------------------------------------------
	if [[ $# == 0 ]]; then
	    if [[ $TYPE == "" ]] && [[ $PROJET == "" ]]; then
	        condition=2
	        msg="${COLOR4}${GRAS}Aucun type ni projet n'a encore ete sette. Utilisez les commandes 'settype' et 'setprojet'."
	    elif [[ $TYPE != "" ]] && [[ $PROJET == "" ]]; then
	        condition=2
	        msg="${COLOR4}${GRAS}Aucun projet n'a ete sette. Utilisez la commande 'setprojet'."
	    elif [[ $TYPE != "" ]] && [[ $PROJET != "" ]]; then
	        condition=1
	    fi

	    export FOLDER=""
	    export SOFT=""
	    export ROOT_FOLDER=""
	    export ROOT_SOFT=""
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
				condition=0
				msg="Espace de travail cree."
			elif [[ $reponse == "n" ]]; then
                condition=1
                msg="Commande annulee."
			else
				condition=1
				msg="Erreur de saisie, commande annulee. (setfolder_1)."
			fi
		# si le sous-repertoire existe :
		else
			condition=0
		fi
	fi

	#  trop d'argument :
	#----------------------------------------------------------------------------
	if [[ $# > 1 ]]; then
	    condition=1
		msg "Erreur de saisie (trop d'arguments), commande annulee. (setfolder_2)."
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

        cd $ROOT_FOLDER

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
#        echo "#!/bin/bash" > $BIN/data/pipe_set.sh
#        echo "export TYPE='"$TYPE"'" >> $BIN/data/pipe_set.sh
#        echo "export NAME='"$NAME"'" >> $BIN/data/pipe_set.sh
#
#        dt=`date +%F"--"%T`
#
#        echo $dt-----job $TYPE $NAME >> $BIN/data/pipe_set_history.txt
#        echo -e $VERT
#        echo -e "Enregistrement des donnees de set OK."$NEUTRE
#
#
#
#		cd $go
#		lst "TYPE = $TYPE \n NAME = $NAME \n SOFT :" $WORK 1
#		ps1

        lst "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET${COLOR0} \n FOLDER..... ${COLOR3}$FOLDER" "Liste des espaces de travail pour le projet ${COLOR3}$PROJET${COLOR0}${GRAS} / ${COLOR3}$FOLDER${COLOR0}${GRAS} :" $ROOT_FOLDER/02_work 1
        ps1




	elif [[ $condition == 1 ]]; then
        cd $ROOT_PROJET
        cl
        lst "${NEUTRE}${COLOR0}TYPE....... ${COLOR3}$TYPE${COLOR0} \n PROJET..... ${COLOR3}$PROJET" "Liste des repertoires pour le projet ${COLOR3}$PROJET${COLOR0} :" $ROOT_PROJET 1
        echo ""
        echo $msg
		ps1
	elif [[ $condition == 2 ]]; then
        cd $ROOT_PROJET
        echo ""
        echo $msg

		ps1
	fi
}




# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   02_setfolder.sh" "o"
fi
# ======================================================================================================================




