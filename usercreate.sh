#!/bin/bash

#Script for adding users in a batch

#Input file
USERFILE=$1

if [ "$USERFILE" = "" ] 
then
	echo "Please enter a userfile as first argument."
	exit 10
elif test -f $USERFILE
then
	for user in `cat $USERFILE`
	do
		echo "Creating "$user" user..."
		useradd -m $user
		read -p "Choose password:" -s pass
		echo
		echo "Adding password..."
		echo "$user:$pass" | chpasswd
	done
	exit 20
else
	echo "Invalid input file."
	exit 30
fi
