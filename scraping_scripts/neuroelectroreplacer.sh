#!/bin/bash

# Define the directory to process
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-4/data/ephys_prop"

# Define search and replacement strings
SEARCH_REPLACE=(
    "https://neuroelectro.org/article/index ../../article/index.html"
    "https://neuroelectro.org/api/docs ../../api/docs.html"
    "https://neuroelectro.org/contribute ../../contribute.html"
    "https://neuroelectro.org/ephys_prop/index ../../ephys_prop/index.html"
    "https://neuroelectro.org/neuron/index ../../neuron/index.html"
    "https://neuroelectro.org/publications ../../publications.html"
    "https://neuroelectro.org/faqs ../../faqs.html"
    "https://neuroelectro.org/neuron/clustering ../../neuron/clustering.html"
)
REGEX_REPLACE=(
    "https://web.archive.org/web/[0-9]{14}/"
)

# Define the new regex for neuron/ephys_prop data links
SEARCH10="https://neuroelectro.org/\(article\|data_table\)/\([0-9]\{5\}\)/"
REPLACE10="../datatable/ephys_prop/\2/data/index.html"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found."
    exit 1
fi

# Iterate through files in the directory
for FILE in "$DIR"/*; do
    if [ -f "$FILE" ]; then
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

echo "Replacement complete."
