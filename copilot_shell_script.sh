#!/bin/bash

#prompt the user for new assignment name
read -p "Please enter new assignment name" new_name

if [ -z "$new_name" ]; then
	echo "please enter the new name.Field can not be empty"
	exit 1
fi

# find the directory where the config file is it does this by finding the directory created by create_environment.sh
reminder_dir=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1 )

# If not found, show error
if [ -z "$reminder_dir" ]; then
    echo "Could not find the submission_reminder directory."
    echo "Make sure you ran the create_environment.sh before running this one."
    exit 1
fi

