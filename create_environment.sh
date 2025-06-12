#!/bin/bash

read -p "Please enter your name: " name

if [ "$name" ]; then
    mkdir submission_reminder_$name
    dir_name=submission_reminder_$name

    # Create app directory
    mkdir $dir_name/app

    # Creating the reminder.sh file and adding the data
    cat > "$dir_name/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Create modules directory
    mkdir $dir_name/modules
    
    # Creating the functions.sh file and adding the data
    cat > "$dir_name/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Create assets directory
    mkdir $dir_name/assets
    
    # Creating the submissions.txt with at least 5 additional student records
    cat > "$dir_name/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Jules, Shell Advanced, submitted
Ishigami, Shell Navigation, not submitted
Kuwabara, Git, submitted
Hanji, Shell Navigation, not submitted
Yamato, Shell Navigation, submitted
Alice, Shell Navigation, not submitted
Bob, Git, submitted
Charlie, Shell Basics, not submitted
Diana, Shell Advanced, submitted
Eve, Shell Navigation, not submitted
Frank, Git, not submitted
EOF

# Create config directory
    mkdir $dir_name/config
    
    # Creating the config.env file and populating it
    cat > "$dir_name/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

    # Creating the startup.sh script
    cat > "$dir_name/startup.sh" << 'EOF'
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
EOF