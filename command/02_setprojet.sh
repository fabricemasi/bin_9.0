#! /bin/bash

# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   02_setprojet.sh" "i"
fi
# ======================================================================================================================


setprojet ()
{
	go="."              # stocke le path provisoire. C'est l'endroit ou l'on va se deplacer.
	condition=1         # si a la fin condition = 0, le projet est sette, sinon on sort sans setter le projet
    retour=0

	#  0 argument :
	#----------------------------------------------------------------------------
	if [[ $# == 0 ]]; then
        if [[ $TYPE == "" ]]; then
            settype 3d
        else
            condition=0
            export TYPE=$TYPE
            export PROJET=""
            export SOFT=""
        fi
	fi

	#  1 argument :
	#----------------------------------------------------------------------------
	if [[ $# == 1 ]]; then

		path=$ROOT_TYPE/$1

		# si le projet n'existe pas :
		if ! [[ -e $path ]]; then
			echo -e ${GRIS2} ""
			read -p "Le projet $1 n'existe pas. Voulez vous le créer ? (o,n) " reponse
			echo -e ${NEUTRE} ""

			if [[ $reponse == "o" ]]; then
				mkdir $path
				mkdir $path/01_ref
				mkdir $path/02_work
				mkdir $path/03_temp
				mkdir $path/04_publish
				mkdir $path/05_final
				go="$path/02_work"
				NAME=$1
				condition=1

				echo -e ${NEUTRE} ""
                echo -e "creation de $ROOT_PROJET/${JAUNE}$1"
			    echo -e ${NEUTRE} ""

			elif [[ $reponse == "n" ]]; then
				go="$ROOT_PROJET"
				condition=0
			else
				echo "Erreur de saisie, commande annulee. (setprojet_1) "
				go="$ROOT_PROJET"
				condition=0
			fi
		# si le projet existe :
		else
			NAME=$1
			# si le dernier caractere est "/" on le supprime
			if [[ ${NAME: -1} == "/" ]]; then
			 	NAME=${NAME:: -1}
			fi
			go="$path/02_work"
			condition=1
		fi
	fi

	#  trop d'argument :
	#----------------------------------------------------------------------------
	if [[ $# > 1 ]]; then
		echo "Erreur de saisie, commande annulee. (setprojet_2) "
		go="."
		condition=0
	fi


	# =============================================
	#  resultat :
	# =============================================

    clear

	if [[ $condition == 1 ]]; then
		export TYPE=$TYPE
		export NAME=$NAME

        export REF=$ROOT_PIPE/projets/$TYPE/$NAME/01_ref
		export WORK=$ROOT_PIPE/projets/$TYPE/$NAME/02_work
        export TEMP=$ROOT_PIPE/projets/$TYPE/$NAME/03_temp
        export PUBLISH=$ROOT_PIPE/projets/$TYPE/$NAME/04_publish
        export FINAL=$ROOT_PIPE/projets/$TYPE/$NAME/05_final

        if [[ $SYSTEM == "windows" ]]; then
            echo "Systeme detecte : WINDOWS"
            echo "  -> Correction de la variable d'environnement 'PUBLISH'"
            publish_w=""$ROOT_PIPE_W"\\projets\\"$TYPE"\\"$NAME"\\04_publish"
            /mnt/c/Windows/System32/reg.exe add "HKCU\Environment" /v PUBLISH /t REG_SZ /d $publish_w /f
        fi



        echo "#!/bin/bash" > $BIN/data/pipe_set.sh
        echo "export TYPE='"$TYPE"'" >> $BIN/data/pipe_set.sh
        echo "export NAME='"$NAME"'" >> $BIN/data/pipe_set.sh

        dt=`date +%F"--"%T`

        echo $dt-----job $TYPE $NAME >> $BIN/data/pipe_set_history.txt
        echo -e $VERT
        echo -e "Enregistrement des donnees de set OK."$NEUTRE



		cd $go
		lst "TYPE = $TYPE \n NAME = $NAME \n SOFT :" $WORK 1
		ps1
	else
		cd $go
		lst "TYPE = $TYPE \n NAME :" $ROOT_PROJET 2
		ps1
	fi
}




# ======================================================================================================================
if [[ $VERBOSE>0 ]]; then
    debug "|   02_setprojet.sh" "o"
fi
# ======================================================================================================================
