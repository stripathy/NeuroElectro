#!/bin/bash

folder_path="/Users/hugohudson/Downloads/NeuroElectro-main-4/ephys_prop"
search_pattern="https://www.neuroelectro.org/ephys_prop/([0-9]+)/data/"
# Iterate over all HTML files in the folder
for file in "$folder_path"/*.html; do
    if [[ -f "$file" ]]; then
        # Use sed to replace the pattern with the new string
        sed -i '' -E "s|$search_pattern|../data/ephys_prop/\1.html/\1/data/index.html|g" "$file"
        echo "Updated: $file"
    fi
done

echo "String replacement complete!"
