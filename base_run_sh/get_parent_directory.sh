#!/bin/bash


DIRS_FILE=($(echo "$1" | tr '/' ' '))
DIRS="/"
for (( i=0; i < ${#DIRS_FILE[*]} -1; i++ ));do
    if (( $i < ${#DIRS_FILE[*]} -2)); then
        DIRS="$DIRS""${DIRS_FILE[$i]}""/";  
    elif (( $i == ${#DIRS_FILE[*]} -2 ));then
        DIRS="$DIRS""${DIRS_FILE[$i]}";  
    fi
	
done

printf "%s" "$DIRS"


#if [ ! -e $DIRS ];then
#	mkdir -p "${DIRS}"
#fi