#!/bin/bash

#prompt the user for new assignment name
read -p "Please enter new assignment name" new_name

if [ -z "$new_name" ]; then
	echo "please enter the new name.Field can not be empty"
	exit 1
fi


