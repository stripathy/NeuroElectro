#!/bin/bash

# Set the directory containing the HTML files
DIRECTORY="/Users/hugohudson/Downloads/NeuroElectro-main-4/ephys_prop"

# Define the URLs you want to replace and their replacements
# Use regular expressions in the replacement if necessary
declare -A REPLACEMENTS
REPLACEMENTS["http://www.neuroelectro.org/article/index"]="../../article/index.html"
REPLACEMENTS["http://www.neuroelectro.org/api/docs"]="../../api/docs.html"
REPLACEMENTS["http://www.neuroelectro.org/contribute"]="../../contribute.html"
REPLACEMENTS["http://www.neuroelectro.org/ephys_prop/index"]="../../ephys_prop/index.html"
REPLACEMENTS["http://www.neuroelectro.org/neuron/index"]="../../neuron/index.html"
REPLACEMENTS["http://www.neuroelectro.org/publications"]="../../publications.html"
REPLACEMENTS["http://www.neuroelectro.org/faqs"]="../../faqs.html"
REPLACEMENTS["http://www.neuroelectro.org/neuron/clustering"]="../../neuron/clustering.html"
REPLACEMENTS["\/Users\/hugohudson\/Downloads\/NeuroElectro-main-2\/data\/([0-9]+)\.html\/index\.html
"]="../../data/\1.html/index.html"
REPLACEMENTS["https://web.archive.org/web/[0-9]{14}/"]=""
# Iterate through all HTML files in the specified directory
for FILE in "$DIRECTORY"/*.html; do
    # Check if the file exists
    if [[ -f "$FILE" ]]; then
        echo "Processing $FILE..."

        # Iterate through all replacements
        for OLD_URL in "${!REPLACEMENTS[@]}"; do
            NEW_URL="${REPLACEMENTS[$OLD_URL]}"

            # Replace the URLs using sed
            # -r enables extended regex, -i edits files in place
            sed -i -r "s|$OLD_URL|$NEW_URL|g" "$FILE"
        done
    fi
done

echo "URL replacement complete!"
