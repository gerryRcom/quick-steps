#!/bin/bash
# Quick Steps Menu System
# All quick steps docs should be stored in ./qs-docs sub folder folder
# The first line of each quick steps doc is used as the menu item so keep it short yet decriptive
if [ ! -d ./qs-docs ]; then
    echo "Sub directory qs-docs does not exist, please ensure it is located in the same dir as the main qs.sh script"
    exit
fi

# Set the seperater as a \n to prevent filenames with spaces splitting.
IFS='
'

if compgen -G "./qs-docs/*.txt" > /dev/null
	then
        i=1

        #echo "Please select one of the following docs to display (enter number):"
        echo "---------------------------------------------------"
		for doc in ./qs-docs/*.txt
        # Take the first line of each .txt file and generate the menu.
		do
            qsDescription=`head -n 1 $doc`
            echo $i")" $qsDescription
            (( i++ ))
		done
        echo "---------------------------------------------------"

        # Ask for a choice and repeat prompt if nothing is entered.
        while [[ -z $qsChoice ]]
        do
            read -p "Please choose one of the above options to display (enter number): " qsChoice
        done
        i=1
        echo "---------------------------------------------------"

        # Display the contents of the file chosen from the menu.
        for doc in ./qs-docs/*.txt
		do
            if [ $i == $qsChoice ]
                then
                    cat $doc
                    unset IFS
                    exit
                else
                    (( i++ ))
            fi
		done
else
    echo "No .txt files located in the ./qs-docs folder, please add some."
    unset IFS
    exit
fi
echo "Invalid choice, please try again."
unset IFS
exit