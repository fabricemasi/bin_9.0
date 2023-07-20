#! /bin/bash
# Load le dernier set projet

jll ()
{
	source $BIN/data/pipe_set.sh
    job $TYPE $PROJET $FOLDER
}