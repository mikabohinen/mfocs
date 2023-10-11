#!/bin/bash

# Define the root directory for the courses
COURSE_ROOT="$HOME/workspace/master/michaelmas"

# Get a list of courses
DIRECTORIES=$(find "$HOME/workspace/master/michaelmas/" -maxdepth 1 -type d | awk -F/ '{print $NF}' | tail -n +2)

# Prompt the user to select a course using rofi
SELECTED_COURSE=$(echo "$DIRECTORIES" | rofi -dmenu \
                                        -theme "$HOME/.config/rofi/config/launcher.rasi" \
                                        -p "Select a course:")

# Update the symbolic link to point to the selected course
if [[ -n $SELECTED_COURSE ]]; then
    ln -sfn "$COURSE_ROOT/$SELECTED_COURSE" "$HOME/workspace/master/current_course"
else
    echo "No course selected."
    exit 1
fi

