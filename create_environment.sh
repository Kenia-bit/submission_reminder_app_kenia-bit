#!/bin/bash

# Prompting the user to enter the name

read -p "Enter your name: " name

mkdir submission_reminder_"$name"

# Creating app directory in submission_reminder_"$name"

cd submission_reminder_"$name" || exit
mkdir app

# Creating a file called reminder.sh in app directory

cat << 'EOF' > app/reminder.sh

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
chmod +x app/reminder.sh

# Creating modules directory in submission_reminder_"$name"

mkdir modules

# Creating a file called functions.sh in modules directory

cat << 'EOF' > modules/functions.sh

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
chmod +x modules/functions.sh

# Creating assets directory in submission_reminder_"$name"

mkdir assets

# Creating a file called submissions.txt in assets directory

cat << 'EOF' > assets/submissions.txt

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Kenia, Shell Navigation, not submitted
Irene, Git, submitted
Pascaline, Shell Basics,submitted
Kevin, Shell Basics, submitted
Eric, Shell Navigation, not submitted
EOF
chmod +x assets/submissions.txt

# Creating config directory in submission_reminder_"$name"

mkdir config

# Creating a file called config.env in config directory

cat << 'EOF' > config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
chmod +x config/config.env

# Creating a file called startup.sh in submission_reminder_"$name"

touch startup.sh
chmod +x startup.sh

cat << 'EOF' > startup.sh
#!/bin/bash

# Everytime work from the directory of this script
cd "$(classdir "$0")" || exit 1

# Source for functions and config
source ./config/config.env
source ./modules/functions.sh

# Run the reminder
bash ./app/reminder.sh
EOF
chmod +x startup.sh
