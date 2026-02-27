#!/bin/bash

# Check if the active window is already floating
is_floating=$(hyprctl activewindow -j | jq '.floating')

if [[ "$is_floating" == "true" ]]; then
    # If already floating, tile it back
    hyprctl dispatch togglefloating
else
    # Float it, resize to 80% of screen, then center
    hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact 70% 70%; dispatch centerwindow 1"
fi
