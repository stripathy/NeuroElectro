#!/bin/bash

BASE_URL="https://web.archive.org/web/20211205193428/https://neuroelectro.org/ephys_prop"
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/ephys_prop"
DATA_DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/data/ephys"  # Folder for all downloads
count=0  # Initialize a counter

# Create the data folder if it doesn't exist
mkdir -p "$DATA_DIR"

for FILE in "$DIR"/*; do
    echo "INITIAL FILE: $FILE"
    if [ -f "$FILE" ]; then
        # Extract filename without path and remove .html extension
        NUMBER=$(basename "$FILE" .html)
        echo "NUMBER: $NUMBER"
        # Fetch neuron data page and store in "data" directory
        wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
            --recursive --no-clobber --convert-links --page-requisites \
            --no-parent -P "$DATA_DIR/$NUMBER.html" --cut-dirs=6 -nH "${BASE_URL}/${NUMBER}/data/"
        echo "Downloaded: $DATA_DIR/$NUMBER/data/"

        # Extract unique URLs and append to a file
        grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/data_table/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt
        grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/article/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt

        ((count++))  # Increment counter

        # Pause every 18 requests to avoid getting blocked
        if (( count % 16 == 0 )); then
            echo "Scraped $count pages. Waiting for 5 minutes..."
            sleep 300
        fi

        echo "Processed: $FILE"
    fi
done

echo "Scraping complete. All data saved in '$DATA_DIR'."
