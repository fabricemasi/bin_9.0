#! /bin/bash

# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|   00_job.sh" "i"
fi
# ======================================================================================================================


job_old ()
{
    if [[ $TYPE == "" ]]; then
        if [[ $# == 0 ]]; then
            settype
        elif [[ $# == 1 ]]; then
            settype $1
        elif [[ $# == 3 ]]; then
            echo "#!/bin/bash" > $BIN/data/pipe_set.sh
            echo "export TYPE='"$1"'" >> $BIN/data/pipe_set.sh
            echo "export PROJET='"$2"'" >> $BIN/data/pipe_set.sh
            echo "export FOLDER='"$3"'" >> $BIN/data/pipe_set.sh

            jll
        fi
    elif [[ $PROJET == "" ]]; then
        if [[ $# == 0 ]]; then
            setprojet
        elif [[ $# == 1 ]]; then
            # SPLIT DE LA CHAINE DE CHARACTERES
            pyt1 "split_path.py" $1
            return_nb=`RETURN_NB`
            return1=`RETURN1`
            return2=`RETURN2`

            if [[ $return_nb == 1 ]]; then
                setprojet $1
            elif [[ $return_nb == 2 ]]; then
                setprojet $return1
                setfolder $return2
            fi
        elif [[ S# == 2 ]]; then
            setprojet $1
            setfolder $2
        elif [[ $# == 3 ]]; then
            echo "#!/bin/bash" > $BIN/data/pipe_set.sh
            echo "export TYPE='"$1"'" >> $BIN/data/pipe_set.sh
            echo "export PROJET='"$2"'" >> $BIN/data/pipe_set.sh
            echo "export FOLDER='"$3"'" >> $BIN/data/pipe_set.sh

            jll
        elif [[ S# > 3 ]]; then
            echo -e ${COLOR4}${GRAS}"Erreur, trop d'arguments.(err job_02)"${NEUTRE}
        fi
    elif [[ $PROJET != "" ]]; then
        if [[ $# == 1 ]]; then
            # SPLIT DE LA CHAINE DE CHARACTERES
            pyt1 "split_path.py" $1
            return_nb=`RETURN_NB`
            return1=`RETURN1`
            return2=`RETURN2`

            if [[ $return_nb == 1 ]]; then
                setprojet $1
            elif [[ $return_nb == 2 ]]; then
                setprojet $return1
                setfolder $return2
            fi
        fi
    elif [[ $PROJET != "" ]] && [[ $FOLDER == "" ]]; then
        if [[ $# == 0 ]]; then
            setfolder
        elif [[ $# == 1 ]]; then
            setfolder $1
        elif [[ S# > 2 ]]; then
            echo -e ${COLOR4}${GRAS}"Erreur, trop d'arguments.(err job_03)"${NEUTRE}
        fi
    elif [[ $PROJET != "" ]] && [[ $FOLDER != "" ]]; then
        if [[ $# == 0 ]]; then
            setfolder $FOLDER
        fi
    fi

}







job ()
{
    n=0
    msg=""
    if [[ $# == 0 ]]; then
        n=0
    elif [[ $# == 1 ]]; then
        pyt split_path.py $1
        if [[ $RETURN_NB == 1 ]]; then
            n=1
            arg1=$RETURN1
        elif [[ $RETURN_NB == 2 ]]; then
            n=2
            arg1=$RETURN1
            arg2=$RETURN2
        elif [[ $RETURN_NB == 3 ]]; then
            n=3
            arg1=$RETURN1
            arg2=$RETURN2
            arg3=$RETURN3
        elif [[ $RETURN_NB > 3 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_001)"
        fi
        msg=""
    elif [[ $# == 2 ]]; then
        pyt split_path.py $1
        if [[ $RETURN_NB == 1 ]]; then
            n=1
            arg1=$RETURN1
        elif [[ $RETURN_NB == 2 ]]; then
            n=2
            arg1=$RETURN1
            arg2=$RETURN2
        elif [[ $RETURN_NB == 3 ]]; then
            n=3
            arg1=$RETURN1
            arg2=$RETURN2
            arg3=$RETURN3
        elif [[ $RETURN_NB > 3 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_002)"
        fi

        pyt split_path.py $2
        if [[ $n == 1 ]] && [[ $RETURN1 == 1 ]]; then
            n=2
            arg2=$RETURN1
        elif [[ $n == 1 ]] && [[ $RETURN1 == 2 ]]; then
            n=3
            arg2=$RETURN1
            arg3=$RETURN2
        elif [[ $n == 1 ]] && [[ $RETURN1 > 2 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_003)"
        elif [[ $n == 2 ]] && [[ $RETURN1 == 1 ]]; then
            n=3
            arg3=$RETURN1
        elif [[ $n == 2 ]] && [[ $RETURN1 > 1 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_004)"
        elif [[ $n == 3 ]] && [[ $RETURN1 > 0 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_005)"
        fi
    elif [[ $# == 3 ]]; then
        TYPE=""
	    PROJET=""
	    FOLDER=""
	    SOFT=""

        if [[ $n > 1 ]]; then
            msg="Erreur, trop d'arguments en retour (err job_006)"
        fi

        pyt split_path.py $1
        if [[ $RETURN_NB == 1 ]]; then
            arg1=$RETURN1
        else
            msg="Erreur, trop d'arguments en retour (err job_007)"
        fi

        pyt split_path.py $2
        if [[ $RETURN_NB == 1 ]]; then
            arg2=$RETURN1
        else
            msg="Erreur, trop d'arguments en retour (err job_008)"
        fi

        pyt split_path.py $3
        if [[ $RETURN_NB == 1 ]]; then
            n=3
            arg3=$RETURN1
        else
            msg="Erreur, trop d'arguments en retour (err job_009)"
        fi
    elif [[ $# > 3 ]]; then
        msg="Erreur, trop d'arguments en retour (err job_010)"
    fi






    if [[ $msg == "" ]]; then
        if [[ $TYPE == "" ]] && [[ $PROJET == "" ]] && [[ $FOLDER == "" ]]; then
            if [[ $n == 0 ]]; then
                settype
            elif [[ $n == 1 ]]; then
                settype $arg1
            elif [[ $n == 2 ]]; then
                settype $arg1
                setprojet $arg2
            elif [[ $n == 3 ]]; then
                settype $arg1
                setprojet $arg2
                setfolder $arg3
            fi
        elif [[ $TYPE != "" ]] && [[ $PROJET == "" ]] && [[ $FOLDER == "" ]]; then
            if [[ $n == 0 ]]; then
                setprojet
            elif [[ $n == 1 ]]; then
                setprojet $arg1
            elif [[ $n == 2 ]]; then
                setprojet $arg1
                setfolder $arg2
            fi
        elif [[ $TYPE != "" ]] && [[ $PROJET != "" ]] && [[ $FOLDER == "" ]]; then
            if [[ $n == 0 ]]; then
                setfolder
            elif [[ $n == 1 ]]; then
                0 $arg1
            fi
        elif [[ $TYPE != "" ]] && [[ $PROJET != "" ]] && [[ $FOLDER != "" ]]; then
            if [[ $n == 0 ]]; then
                setfolder $FOLDER
            elif [[ $n == 1 ]]; then
                setfolder $arg1
            fi
        fi
    else
        echo ""
        echo -e ${COLOR6}${GRAS}$msg${NEUTRE}
    fi
}




a ()
{
    pyt1 test.py $1 $2
}







# ======================================================================================================================
# Afficher informations si $VERBOSE>1
if [[ $VERBOSE>0 ]]; then
    debug "|  00_job.sh" "o"
fi
# ======================================================================================================================