#!/bin/bash

# Define the directory to process
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-8/datatable/neuron2"
# make sure only 2 ../ for neuron data
# Define search and replacement strings
SEARCH_REPLACE=(
    "https://neuroelectro.org/article/index ../../../article/index.html"
    "https://neuroelectro.org/api/docs ../../../api/docs.html"
    "https://neuroelectro.org/contribute ../../../contribute.html"
    "https://neuroelectro.org/ephys_prop/index ../../../ephys_prop/index.html"
    "https://neuroelectro.org/neuron/index ../../../neuron/index.html"
    "https://neuroelectro.org/publications ../../../publications.html"
    "https://neuroelectro.org/faqs ../../../faqs.html"
    "https://neuroelectro.org/neuron/clustering ../../../neuron/clustering.html"
    "https://neuroelectro.org/neuron_search ../../../neuron_search.html"
    "https://www.neuroelectro.org/article/index ../../../article/index.html"
    "https://www.neuroelectro.org/api/docs ../../../api/docs.html"
    "https://www.neuroelectro.org/contribute ../../../contribute.html"
    "https://www.neuroelectro.org/ephys_prop/index ../../../ephys_prop/index.html"
    "https://www.neuroelectro.org/neuron/index ../../../neuron/index.html"
    "https://www.neuroelectro.org/publications ../../../publications.html"
    "https://www.neuroelectro.org/faqs ../../../faqs.html"
    "https://www.neuroelectro.org/neuron/clustering ../../../neuron/clustering.html"
    "https://www.neuroelectro.org/neuron_search ../../../neuron_search.html"
)
REGEX_REPLACE=(
    "https://web.archive.org/web/[0-9]{14}/"
)

# Define the new regex for neuron/ephys_prop data links
# SEARCH10="https://www.neuroelectro.org/data_table/([0-9]+)/"
# REPLACE10="../../../../../datatable/ephys_prop/\1.html"

# SEARCH19="https://www.neuroelectro.org/article/([0-9]+)/"
# REPLACE19="../../../../../article/ephys_prop/\1.html"

SEARCH11="web.archive.org/web/([0-9]{14})"
REPLACE11="https://web.archive.org/web/\1"

SEARCH121="/web/([0-9]{14})/"
REPLACE121="https://web.archive.org/web/\1"

SEARCH13="https://www.neuroelectro.org/neuron/([0-9]+)/"
REPLACE13="../../../neuron/\1.html"

SEARCH14="https://www.neuroelectro.org/ephys_prop/([0-9]+)/"
REPLACE14="../../../ephys_prop/\1.html"

SEARCH10="https://www.neuroelectro.org/data_table/([0-9]+)/"
REPLACE10="../../../datatable/neuron/\1.html"

SEARCH19="https://www.neuroelectro.org/article/([0-9]+)/"
REPLACE19="../../../article/ephys_prop/\1.html"

SEARCH23="https://www.neuroelectro.org/neuron/([0-9]+)/"
REPLACE23="../../../neuron/\1.html"

SEARCH24="https://www.neuroelectro.org/ephys_prop/([0-9]+)/"
REPLACE24="../../../ephys_prop/\1.html"

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
        # sed -E -i '' "s|$SEARCH11|$REPLACE11|g" "$FILE"
        sed -E -i '' "s|$SEARCH121||g" "$FILE"
        sed -E -i '' "s|$SEARCH19|$REPLACE19|g" "$FILE"
        sed -E -i '' "s|$SEARCH13|$REPLACE13|g" "$FILE"
        sed -E -i '' "s|$SEARCH14|$REPLACE14|g" "$FILE"
        
        echo "Modified: $FILE"
    fi
done

echo "Replacement complete."
