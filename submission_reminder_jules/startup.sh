#!/bin/bash

# Change to the application directory
cd "$(dirname "$0")"

# Source the configuration
source config/config.env

# Make all .sh files executable
chmod +x app/reminder.sh
chmod +x modules/functions.sh

# Run the reminder application
./app/reminder.sh
