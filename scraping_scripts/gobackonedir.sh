#!/bin/bash

# Define the directory containing your HTML files
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-4/ephys_prop"

# Iterate through each HTML file in the directory
for FILE in "$DIR"/*.html; do
    if [ -f "$FILE" ]; then
        # Use sed to replace "../../" with "../" in each file
        sed -i '' 's|\.\./\.\./|\.\./|g' "$FILE"
        echo "Modified: $FILE"
    fi
done

echo "Replacement complete."