#!/bin/bash

# Everytime work from the directory of this script
cd "$(dirname "$0")" || exit 1

# Source for functions and config
source ./config/config.env
source ./modules/functions.sh

# Run the reminder
bash ./app/reminder.sh
