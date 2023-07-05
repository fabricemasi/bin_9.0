#! /bin/bash

tre ()
{
    if [[ $# == 1 ]]; then
        tree -I '__*' -L $1 -v
    fi
}
