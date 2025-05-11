#!/bin/bash

# Paths to your Conky config files
conky_configs=(
    "/home/arthur/.config/conky/.conky_network"
    "/home/arthur/.config/conky/.conky_day"
    "/home/arthur/.config/conky/.conky_files"
    "/home/arthur/.config/conky/.conky_cpu"
    "/home/arthur/.config/conky/.conky_memory"
)

# Flag to track whether any of them are already running
any_running=false

for config in "${conky_configs[@]}"; do
    if pgrep -f "conky -c $config" > /dev/null; then
        any_running=true
        break
    fi
done

if [ "$any_running" = false ]; then
    echo "No specific Conky configs are running. Starting all..."
    for config in "${conky_configs[@]}"; do
        conky -c "$config" &
    done
else
    echo "At least one Conky config is already running. No action taken."
fi
