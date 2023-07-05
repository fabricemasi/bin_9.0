#! /bin/bash

# ----------------------------------------------------------------------------------------------------------------------
# ENTETE
# ----------------------------------------------------------------------------------------------------------------------

echo -e "$BLEU2[ep0.sh           ]$VERT>$NEUTRE"

# ----------------------------------------------------------------------------------------------------------------------
# ENTETE
# ----------------------------------------------------------------------------------------------------------------------

############################################################################################################
## TOOLS :
############################################################################################################

cine ()
{
	python $BIN/prog/cineteque/main.py `pwd` $1
}

ref ()
{

    if [[ $PROJ != "" ]]; then
        link_ref=`lk "$PROJ_ROOT/$PROJ/_ref" "-r"`
        echo $link_ref
    else
        link_ref=$PIPE_ROOT/ref
        link_ref=`lk "$link_ref" "-r"`
        cd $link_ref
    fi

    explorer $link_ref
}

save ()
{
	ad_pipe="/home/Fabrice"
	ad_save="/cygdrive/c/Users/Fabrice/Drive/SAUVEGARDES/PIPE"
	
	dt=`date +"%Y-%m-%d_%H%M%S"`

	mkdir $ad_save/$dt

	cp -Rv $ad_pipe/bin $ad_save/$dt/
	cp -v $ad_pipe/.bashrc $ad_save/$dt/.bashrc

    cp -Rvn /cygdrive/f/PHOTOS/01_PHOTOS /cygdrive/c/Users/Fabrice/Drive/SAUVEGARDES/PHOTOS
}

create_repertoire ()
{
	## argument 1 : chemin
	## argument 2 : repertoire a creer

	if [[ -e $1 ]]; then
		if ! [[ -e $1/$2 ]]; then
			mkdir $1/$2
		fi
	else
		echo "Impossible de creer le repertoire '$2' car le chemin '$1' n'existe pas"
	fi
}

create_link ()
{
	## argument 1 : Repertoire ou fichier a linker
	## argument 2 : Endroit ou sera place le link
	## argument 3 : nom du link

	if [[ -e $1 ]]; then
		if [[ -e $2 ]]; then
			if ! [[ -e $2/$3 ]]; then
				cd $2
				ln -s $1 $3
				cd -
			fi
		else
			echo "Impossible de creer le lien symbolique, le repertoire de destination '$2' n'existe pas"
		fi
	else
		echo "Impossible de creer le lien symbolique, l'objet a linker '$1' n'existe pas"
	fi
}




verif_env ()				# OP 			# 0 arg   # verifie si les ENV existent, se set si oui  
{

	if [[ $PROJ != "" ]] && [[ $SHOT != "" ]] && [[ $DISC != "" ]] && [[ $SOFT != "" ]] && [[ $FILE != "" ]]; then
		echo -e $ROUGE "Ouverture du fichier : " $FILE $NEUTRE
		tr
		case $SOFT in
			maya)
				gomaya
				Maya $FILE &
				;;
			houdini)
				hip
				Hou $FILE &
				;;
			blender)
				goblender
				Blender $DISCIPLINE_PATH\\work\\workspace\\blender\\scenes\\$FILE &
				;;
			nuke)
				gonuke
				Nuke $FILE &
				;;
			katana)
				gokatana
				Katana $FILE &
				;;
			photoshop)
				gophotoshop
				Photoshop $FILE &
				;;
			zbrush)
				gozbrush
				Zbrush $FILE &
				;;
			pftrack)
				gopftrack
				;;
			mari)
				gomari
				Mari $FILE &
				;;
			substance_d)
				gosubstance_d
				Substance_d $FILE &
				;;
			substance_p)
				gosubstance_p
				Substance_p $FILE &
				;;
		esac
	elif [[ $PROJ != "" ]] && [[ $SHOT != "" ]] && [[ $DISCIPLINE != "" ]] && [[ $SOFT != "" ]]; then

		#job $PROJ $SHOT $DISCIPLINE
		tr
		case $SOFT in
			maya)
				gomaya
				;;
			houdini)
				hip
				;;
			blender)
				goblender
				;;
			nuke)
				gonuke
				;;
			katana)
				gokatana
				;;
			photoshop)
				gophotoshop
				;;
			zbrush)
				gozbrush
				;;
			pftrack)
				gopftrack
				;;
			mari)
				gomari
				;;
			substance_d)
				gosubstance_d
				;;
			substance_p)
				gosubstance_p
				;;
		esac
	elif [[ $PROJ != "" ]] && [[ $SHOT != "" ]] && [[ $DISCIPLINE != "" ]]; then
		#job $PROJ $SHOT $DISCIPLINE
		tr

	elif [[ $PROJ != "" ]] && [[ $SHOT != "" ]]; then
		#job $PROJ $SHOT
		tr 

	elif [[ $PROJ != "" ]]; then
		#job $PROJ
		tr

	fi
}






logOpen()
{
	if [[ $# == 1 ]]; then
		clr 'rouge'
		C1=$couleur
		
		clr 'blanc'
		C2=$couleur
		
		clr 'neutre'
		C3=$couleur
		echo -e $C1
		echo -e "================================"
		echo -e " Soft in run : $C3$1$C1"
		echo -e "================================"$C3
	fi
}





############################################################################################################
## GO :
############################################################################################################





gokatana ()
{
	path="$DISCIPLINE_PATH/work/workspace/katana/scenes"
	liste_disciplines="common lighting lookdev"
    extension="katana"

    export SOFT="KATANA"

	go $path $liste_disciplines $extension
}

gosubstance_d ()
{
	path="$DISCIPLINE_PATH/work/workspace/substance_d/scenes"
	liste_disciplines="surfacing lighting lookdev"
    extension="sbs"

    export SOFT="SUBSTANCE_D"

	go $path $liste_disciplines $extension
}

gosubstance_p ()
{
	path="$DISCIPLINE_PATH/work/workspace/substance_p/scenes"
	liste_disciplines="surfacing lighting lookdev"
    extension="spp"

    export SOFT="SUBSTANCE_P"

	go $path $liste_disciplines $extension
}

gomari ()
{
	path="$DISCIPLINE_PATH/work/workspace/mari/scenes"
	liste_disciplines="common lighting lookdev"
    extension="mari"

    export SOFT="MARI"

	go $path $liste_disciplines $extension
}



gophotoshop ()
{
	path="$DISCIPLINE_PATH/work/workspace/photoshop/scenes"
	liste_disciplines="all"
    extension="psd"

    export SOFT="PHOTOSHOP"

	go $path $liste_disciplines $extension
}

gozbrush ()
{
	path="$DISCIPLINE_PATH/work/workspace/zbrush/scenes"
    liste_disciplines="common concept texturing modeling"
    extension="zbr"

    export SOFT="ZBRUSH"

	go $path $liste_disciplines $extension
}

gopftrack ()
{
	path="$DISCIPLINE_PATH/work/workspace/pftrack/scenes"
    liste_disciplines="common matchmove"
    extension="pfmpe"

    export SOFT="PFTRACK"

	go $path $liste_disciplines $extension
}



############################################################################################################
## PYQT :
############################################################################################################


ui2py ()
{
	# argument 1 : nom du fichier d'origine (ui)
	# argument 2 : nom du fichier py
	# argument 3 : nom du fichier bat

	if [[ $#==3 ]];then

		# creation du py
		#/cygdrive/c/Python27/Lib/site-packages/PyQt4/pyuic4.bat -x $1 -o $2
		/lib/python2.7/site-packages/PyQt4/pyuic4 -x $1 -o $2
		chmod +x $2

		# creation du bat
		
		touch $3
		echo "\python27\python.exe $2">>$3
		chmod +x $3

	else
		echo "Erreur dans le nombre d'arguments:"
		echo "- arg 1 : nom du fichier d'origine (ui)"
		echo "- arg 2 : nom du fichier py"
		echo "- arg 3 : nom du fichier bat"
	fi
}







############################################################################################################
## HELP :
############################################################################################################





############################################################################################################
## AUTRE :
############################################################################################################

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
	        *.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
	        *.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
	        *.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
	        *.rar)		unrar x $1 && cd $(basename "$1" .rar) ;;
	        *.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
	        *.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
	        *.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
	        *.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
	        *.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
	        *.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
	        *.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
	        *)		    echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}



EP=`lk "$W_ROOT/$BIN/pipe-bin/pipe.sh" "-r"`
alias ep='gedit $EP &'
alias eps="source '$BIN/pipe-bin/pipe.sh'; echo '|-----> Source pipe ok'"

ED=`lk "$W_ROOT/$BIN/.fmz-aliases" "-r"`
alias ed='gedit $ED &'
alias eds="source '$BIN/.fmz-aliases'"

CLRS=`lk "$W_ROOT/$BIN/.fmz-clr" "-r"`
alias clrs='gedit $CLRS &'

alias brc='gedit .bashrc &'

FMRC=`lk "$W_ROOT/$BIN/.fmz-rc" "-r"`
alias fmrc='gedit $FMRC &'

FMBRC=`lk "$W_ROOT/$BIN/.fmz-bashrc" "-r"`
alias fmbrc='gedit $FMBRC &'

UI=`lk "$W_ROOT/$BIN/prog/pipe-ui/mainWindow_setup.py" "-r"`
alias ui='gedit $UI &'
echo $UI


# -------------------------------------------------------------
echo -e "$BLEU2[ep01.sh           ]$ROUGE<$NEUTRE"
# -------------------------------------------------------------