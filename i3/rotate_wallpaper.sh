#!/bin/bash

# Define your two wallpapers
wallpaper1="$HOME/.config/Wallpapers/Sekiro-Wallpaper.jpg"
wallpaper2="$HOME/.config/Wallpapers/Evongelian-Wallpaper.png"

# File to remember which one was last used
state_file="$HOME/.current_wallpaper"

# Check which wallpaper was last used
if [ -f "$state_file" ]; then
    last=$(cat "$state_file")
else
    last=""
fi

# Toggle to the other wallpaper
if [ "$last" = "$wallpaper1" ]; then
    next="$wallpaper2"
else
    next="$wallpaper1"
fi

# Set the wallpaper
feh --bg-scale "$next"

# Save the current wallpaper for next run
echo "$next" > "$state_file"
