#!/bin/bash

# Prompting the user to enter the assignment name 

read -p "Enter an assignment name: " newassignment

classdir=$(find . -type d -name "submission_reminder_*" | tail -n 1)

# Input assignment name to replace the value in config/config.env

configfile="${classdir}/config/config.env"

sed -i "s/ASSIGNMENT=.*/ASSIGNMENT=\"${newassignment}\"/" "$configfile"

#running the startup.sh

"${classdir}/startup.sh"
