#! /bin/bash

if [[ $VERBOSE>0 ]]; then
    echo -e ${MAGENTA} setdiscipline.sh ... IN ${NEUTRE}
fi




setdiscipline ()
{
	condition=1
	DISC=""
	go="."

	if [[ $PROJ == "" ]] || [[ $TYPE == "" ]] || [[ $NAME == "" ]]; then
		echo -e $ROUGE
		echo -e "Vous devez setter un projet un type et un name avant de pouvoir continuer:"
		echo -e "PROJ / TYPE / NAME / DISC / SOFT" $NEUTRE

	else
		## ==============
		##  0 argument :
		## ==============

		if [[ $# == 0 ]]; then
			echo ""
			echo "      Choisir une discipline :"
            echo ""
            echo "      [00] Commun"
			echo "      [10] Concept"
            echo "      [15] Matchmove"
            echo "      [20] Previz"
            echo "      [25] Layout"
            echo "      [30] Modeling"
            echo "      [35] UV Textures Surfacing"
            echo "      [40] Rig"
            echo "      [45] Animation"
            echo "      [60] FX"
            echo "      [61] VFX"
            echo "      [65] Lookdev"
            echo "      [70] Lighting"
            echo "      [75] Compo"
            echo "      [80] Montage"
            echo ""
			echo "      [ctrl c] Exit"
			echo ""

			read -p "Choix : " reponse

			if [[ $reponse == "00" ]]; then
                DISC="common"
            elif [[ $reponse == "10" ]]; then
				DISC="concept"
			elif [[ $reponse == "15" ]]; then
				DISC="matchmove"
			elif [[ $reponse == "20" ]]; then
				DISC="previz"
			elif [[ $reponse == "25" ]]; then
				DISC="layout"
			elif [[ $reponse == "30" ]]; then
				DISC="modeling"
			elif [[ $reponse == "35" ]]; then
				DISC="surfacing"
			elif [[ $reponse == "40" ]]; then
				DISC="rig"
			elif [[ $reponse == "45" ]]; then
				DISC="animation"
			elif [[ $reponse == "50" ]]; then
				DISC="cloth"
			elif [[ $reponse == "55" ]]; then
				DISC="fur"
			elif [[ $reponse == "60" ]]; then
				DISC="fx"
			elif [[ $reponse == "65" ]]; then
				DISC="lookdev"
			elif [[ $reponse == "70" ]]; then
				DISC="lighting"
			elif [[ $reponse == "75" ]]; then
				DISC="compo"
			elif [[ $reponse == "80" ]]; then
				DISC="montage"
			else
				echo "ABORTED"
				condition=0
			fi
		fi

		## ==============
		##  1 argument :
		## ==============

		if [[ $# == 1 ]]; then

			if ! [[ -e $ROOT_NAME/$1 ]]; then

				read -p "La discipline $1 n'existe pas. Voulez vous la creer ? (o,n) " reponse

				if [[ $reponse == "o" ]]; then
					mkdir $ROOT_NAME/$1/ -p -m 777
					DISC=$1
					condition=1
				elif [[ $reponse == "n" ]]; then
					condition=0
				else
					echo "Erreur de saisie, commande annulee. (5)"
					condition=0
				fi
			else
				DISC=$1
			    # si le dernier caractere est "/" on le supprime
                if [[ ${DISC: -1} == "/" ]]; then
                    DISC=${DISC:: -1}
                fi

				condition=1
			fi
		fi

		## ===================
		##  trop d'arguments :
		## ===================

		if [[ $# > 1 ]]; then
			echo "Erreur de saisie, commande annulee. (6) "
			condition=0
		fi

		## ===================
		##  resultat :
		## ===================

		if [[ $condition == 1 ]]; then

# 			export DISC=$DISC
# 			export PATH_DISC="$PATH_NAME/$DISC"
# 			export ROOT_DISC="$ROOT_PROJETS/$PROJ/$TYPE/$NAME/$DISC"
#
#             export ROOT_DISC_W="$ROOT_PROJETS_W/$PROJ/$TYPE/$NAME/$DISC"
#             export ROOT_DISC_W_W="$ROOT_PROJETS_W_W\\$PROJ\\$TYPE\\$NAME\\$DISC"


#			export CACHE="$ROOT_TEMP_W/$PROJ/$TYPE/$NAME/$DISC"
#			export RENDER=$PATH_RENDER
#			export PLAYBLAST=$PATH_PLAYBLAST

			export SOFT=""
			
            export REF=$ROOT_PROJ/__ref/reference
#             export PUBLISH=$ROOT_PROJ/__ref/${TYPE}__${NAME}/publish
#             export CAM=$ROOT_PROJ/__ref/${TYPE}__${NAME}/cam
#             export TEXTURE=$ROOT_PROJ/__ref/${TYPE}__${NAME}/texture
#             export OBJ=$ROOT_PROJ/__ref/${TYPE}__${NAME}/obj

#             lst "SOFTS :" $ROOT_DISC 1

# 			ps1

# 			cd $ROOT_DISC

			echo "#!/bin/bash" > $BIN/data/pipe_set.sh
			echo "export TYPE='"$TYPE"'" >> $BIN/data/pipe_set.sh
			echo "export NAME='"$NAME"'" >> $BIN/data/pipe_set.sh

			dt=`date +%F"--"%T`

			echo $dt-----job $TYPE $NAME >> $BIN/data/pipe_set_history.txt
            echo -e $VERT
            echo -e "Enregistrement des donnees de set OK."$NEUTRE
		else
			cd $go
		fi
	fi
}






if [[ $VERBOSE>0 ]]; then
    echo -e ${GRIS} setdiscipline.sh ... OUT ${NEUTRE}
fi
