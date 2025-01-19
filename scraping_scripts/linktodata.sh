#!/bin/bash

# Define the directory containing your HTML files
NEURON_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-4/neuron"

# Iterate through each HTML file in the neuron directory
for FILE in "$NEURON_DIR"/*.html; do
    if [ -f "$FILE" ]; then
        # Extract the number from the filename (e.g., 1.html -> 1)
        FILENAME=$(basename "$FILE")
        NUMBER="${FILENAME%%.html}"

        # Define the relative replacement path
        NEW_PATH="../data/$NUMBER.html/index.html"

        # Debug: Output current file and old/new path to check
        echo "Processing: $FILE"
        echo "Old path: https://neuroelectro.org/neuron/$NUMBER/data/"
        echo "New relative path: $NEW_PATH"

        # Replace occurrences of the old path with the new relative path
        sed -i '' "s|https://neuroelectro.org/neuron/$NUMBER/data/|$NEW_PATH|g" "$FILE"

        # Check if any replacement was made
        if grep -q "https://neuroelectro.org/neuron/$NUMBER/data/" "$FILE"; then
            echo "No replacement made in $FILE"
        else
            echo "Modified: $FILE"
        fi
    fi
done

echo "Replacement complete."
