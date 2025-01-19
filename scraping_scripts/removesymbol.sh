#!/bin/bash

# Define the folder path
folder_path="/Users/hugohudson/Downloads/NeuroElectro-main-4/data"

# Find all HTML files in the folder and subdirectories
find "$folder_path" -type f -name "*.html" | while read file; do
    if [[ -f "$file" ]]; then
        echo "Processing: $file"
        # Use sed to remove '' (empty string or unwanted characters)
        sed -i '' "s|''||g" "$file"
        echo "Updated: $file"
    fi
done

echo "Removal complete!"