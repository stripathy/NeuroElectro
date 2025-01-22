#!/bin/bash

# Define the directory to process (this is the folder where you want to iterate through files)
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-8/scraping_scripts/tobefixed"

# Define search and replacement strings
SEARCH_REPLACE=(
    "https://www.neuroelectro.org/article/index ../article/index.html"
    "https://www.neuroelectro.org/api/docs ../api/docs.html"
    "https://www.neuroelectro.org/contribute ../contribute.html"
    "https://www.neuroelectro.org/ephys_prop/index ../ephys_prop/index.html"
    "https://www.neuroelectro.org/neuron/index ../neuron/index.html"
    "https://www.neuroelectro.org/publications ../publications.html"
    "https://www.neuroelectro.org/faqs ../faqs.html"
    "https://www.neuroelectro.org/neuron/clustering ../neuron/clustering.html"
)
REGEX_REPLACE=(
    "https://web.archive.org/web/[0-9]{14}/"
)

# Define the new regex for neuron/ephys_prop data links
SEARCH10="https://www.neuroelectro.org/\(article\|data_table\)/\([0-9]\{5\}\)/"
REPLACE10="/Users/hugohudson/Downloads/NeuroElectro-main-4/data/ephys_prop/\2.html/\2/data/index.html"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found."
    exit 1
fi

# Function to recursively iterate through directories and process files
process_directory() {
    # Iterate through files and subdirectories in the current directory
    for FILE in "$1"/*; do
        if [ -d "$FILE" ]; then
            # If it's a directory, recurse into it
            process_directory "$FILE"
        elif [ -f "$FILE" ]; then
            # If it's a file, perform replacements
            echo "Processing: $FILE"

            # Perform simple replacements
            for PAIR in "${SEARCH_REPLACE[@]}"; do
                SEARCH=$(echo "$PAIR" | awk '{print $1}')
                REPLACE=$(echo "$PAIR" | awk '{print $2}')
                sed -i '' "s|$SEARCH|$REPLACE|g" "$FILE"
            done

            # Perform regex replacements
            for REGEX in "${REGEX_REPLACE[@]}"; do
                sed -E -i '' "s|$REGEX||g" "$FILE"
            done

            # Perform the specific replacement for neuron/ephys_prop URLs, retaining the number
            sed -E -i '' "s|$SEARCH10|$REPLACE10|g" "$FILE"

            echo "Modified: $FILE"
        fi
    done
}

# Start processing from the base directory
process_directory "$DIR"

echo "Replacement complete."
