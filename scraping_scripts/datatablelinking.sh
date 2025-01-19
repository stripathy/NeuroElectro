#!/bin/bash

# Define the folder path
folder_path="/Users/hugohudson/Downloads/NeuroElectro-main-4/data"

# Define search and replace pairs
SEARCH_REPLACE=(
    "https://neuroelectro.org/article/index ../../article/index.html"
    "https://neuroelectro.org/api/docs ../../api/docs.html"
    "https://neuroelectro.org/contribute ../../contribute.html"
    "https://neuroelectro.org/ephys_prop/index ../../ephys_prop/index.html"
    "https://neuroelectro.org/neuron/index ../../neuron/index.html"
    "https://neuroelectro.org/publications ../../publications.html"
    "https://neuroelectro.org/faqs ../../faqs.html"
    "https://neuroelectro.org/neuron/clustering ../../neuron/clustering.html"
    "https://web.archive.org/web/[0-9]{14}/ ''"
    "https://www.neuroelectro.org/data_table/([0-9]+)/ ../datatable/neuron/\1/data/index.html"
    "https://www.neuroelectro.org/article/([0-9]+)/ ../article/neuron/\1/index.html"
    "https://neuroelectro.org/neuron/([0-9]+)/ ../neuron/\1.html"
    "https://neuroelectro.org/ephys_prop/([0-9]+)/ ../ephys_prop/\1/index.html"
)

# Find all HTML files in the folder and subdirectories
find "$folder_path" -type f -name "*.html" | while read file; do
    if [[ -f "$file" ]]; then
        echo "Processing: $file"
        # Iterate over each search-replace pair
        for PAIR in "${SEARCH_REPLACE[@]}"; do
            SEARCH=$(echo "$PAIR" | awk '{print $1}')
            REPLACE=$(echo "$PAIR" | awk '{print $2}')
            # Replace occurrences of SEARCH with REPLACE using sed (with regex for patterns)
            sed -i '' -E "s|$SEARCH|$REPLACE|g" "$file"
        done
        echo "Updated: $file"
    fi
done

echo "String replacement complete!"
