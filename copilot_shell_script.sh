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

#fetch the config file and store it in config_file
config_file=$reminder_dir/config/config.env

#check if config file was created 
if [ ! -f "$config_file" ]; then
    echo "Config file not found."
    exit 1
fi

# this finds the assignment in the config file and cahnges in the the one entered by the user
sed -i '' "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_name\"/" "$config_file"

echo "Name changed to: $new_name"

./$reminder_dir/startup.sh
