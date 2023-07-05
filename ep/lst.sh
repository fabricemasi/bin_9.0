#! /bin/bash

lst ()
{
	msg=$1
	path=$2
	cd $path
# 	echo ""
    echo -e $CYAN"-------------------------------------------------------"
#     echo ""
	echo -e $CYAN' '$msg
    echo -e $CYAN"-------------------------------------------------------"

# 	echo ""
	tre $3
	echo ""
    echo -e $CYAN"-------------------------------------------------------"
	echo ""
	echo -e $NEUTRE

# 	echo -e ${ROUGE} ""
# 	echo "TYPE="$TYPE
# 	echo "NAME="$NAME
# 	echo "SOFT="$SOFT
# 	echo -e ${NEUTRE} ""


}