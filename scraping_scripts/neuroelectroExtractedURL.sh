#!/bin/bash

# Define directories for downloads
# DATA_TABLE_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/datatable/ephys_prop/"
# ARTICLE_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/article/ephys_prop/"
DATA_TABLE_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/datatable/neuron/"
ARTICLE_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/article/neuron/"

# Create directories if they don't exist
mkdir -p "$DATA_TABLE_DIR"
mkdir -p "$ARTICLE_DIR"

counter=0

# Read the URLs from the text file and download them into the correct folder
while IFS= read -r url; do
    # Extract the ID from the URL
    id=$(echo "$url" | grep -oE "/(data_table|article)/[0-9]+" | grep -oE "[0-9]+$")
    
    # Check if the ID was successfully extracted
    if [[ -z "$id" ]]; then
        echo "Error: Failed to extract ID from URL: $url"
        continue
    fi

    echo "File number: $id"

    # Determine the target directory
    if [[ $url == *"/data_table/"* ]]; then
        target_dir="$DATA_TABLE_DIR"
    elif [[ $url == *"/article/"* ]]; then
        target_dir="$ARTICLE_DIR"
    else
        echo "Skipping unknown URL type: $url"
        continue
    fi

    # Download the file into the appropriate directory with the ID as the filename
    wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
        -O "${target_dir}${id}.html" "$url"

    ((counter++))
    if (( counter % 16 == 0 )); then
        echo "Downloaded $counter pages. Waiting for 5 minutes..."
        sleep 300
    fi
done < urls.txt

echo "Download complete!"
