#!/bin/bash

# 1. Open a floating Zenity entry dialog
# The --entry-text="" ensures it starts empty.
DESCRIPTION=$(zenity --entry \
    --title="Start Toggl Timer" \
    --text="What are you working on?" \
    --width=400 \
    --window-icon="clock")

# 2. Check if cancelled (Exit code 1) or entered nothing
if [ $? -eq 1 ] || [ -z "$DESCRIPTION" ]; then
    notify-send -a "Toggl Track" -u low "Timer cancelled"
    exit 0
fi

# 3. Start the timer using the Toggl CLI
# We capture the output to verify it worked, but usually "toggl start" is silent on success
toggl stop
toggl start "$DESCRIPTION"

# 4. Send Mako Notification
# -a "Toggl Track": Sets the app name
# -i clock: Uses a generic clock icon
if [ $? -eq 0 ]; then
    notify-send -a "Toggl Track" -i clock "Timer Started" "$DESCRIPTION"
else
    notify-send -a "Toggl Track" -u critical "Error" "Failed to start timer."
fi
