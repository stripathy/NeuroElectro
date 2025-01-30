#!/bin/bash

# Define the directory to process
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-8/5/web.archive.org/web/20240901182905/https:/neuroelectro.org/ephys_prop/5/data"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' not found."
    exit 1
fi

# Iterate through files in the directory
for FILE in "$DIR"/*; do
    if [ -f "$FILE" ]; then
        # Replace static neuroelectro.org links with relative paths
        sudo sed -E -i '' \
            -e 's|https://neuroelectro.org/article/index|../../article/index.html|g' \
            -e 's|https://neuroelectro.org/api/docs|../../api/docs.html|g' \
            -e 's|https://neuroelectro.org/contribute|../../contribute.html|g' \
            -e 's|https://neuroelectro.org/ephys_prop/index|../../ephys_prop/index.html|g' \
            -e 's|https://neuroelectro.org/neuron/index|../../neuron/index.html|g' \
            -e 's|https://neuroelectro.org/publications|../../publications.html|g' \
            -e 's|https://neuroelectro.org/faqs|../../faqs.html|g' \
            -e 's|https://neuroelectro.org/neuron/clustering|../../neuron/clustering.html|g' \
            -e 's|https://www.neuroelectro.org/|../../|g' \
            -e 's|/web/\([0-9]\{14\}\)\(cs\|im\|js\)|https://web.archive.org/web/\1\2_/https://|g' \
            -e 's|https://neuroelectro.org/article/([0-9]{5})/|../article/ephys_prop/\1/data/index.html|g' \
            -e 's|https://neuroelectro.org/data_table/([0-9]{5})/|../datatable/ephys_prop/\1/data/index.html|g'
            "$FILE"

        echo "Modified: $FILE"
    fi
done

echo "Replacement complete."
