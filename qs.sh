#!/bin/bash
# Quick Steps Menu System
# All quick steps docs should be stired in ./qs-docs sub folder folder
# The first line of each quick steps doc is used as the menu item so keep it short yet decriptive
if [ ! -d ./qs-docs ]; then
    echo "Sub directory qs-docs does not exist, please ensure it is located in the same dir as the main qs.sh script"
    exit
fi

if compgen -G "./qs-docs/*.txt" > /dev/null
	then
        i=1
        echo "Please select one of the following docs to display:"
        echo "---------------------------------------------------"
		for doc in ./qs-docs/*.txt
		do
            qsDescription=`head -n 1 $doc`
            echo $i $qsDescription
            (( i++ ))
		done
        read qsChoice
        i=1
        for doc in ./qs-docs/*.txt
		do
            if [ $i == $qsChoice ]
                then
                    cat $doc
                    exit
                else
                    (( i++ ))
            fi
		done
fi