#!/bin/bash

BASE_URL="https://web.archive.org/web/20211205193428/https://neuroelectro.org/"
DIR="/Users/hugohudson/Downloads/NeuroElectro-main-2/data"

# Create the data folder if it doesn't exist
# mkdir -p "$DATA_DIR"
# for subdir in "$DIR"/*/; do  # Loop through all subdirectories inside $DIR
#     printf "Processing: %s\n" "$subdir"
#     NUMBER=$(basename "$subdir" .html)
#     echo "Number: %s\n" "$NUMBER"
#     if [ -d "$subdir" ]; then
#         FILE="${subdir}${NUMBER}/data/index.html"
#         if [ -n "$FILE" ]; then
#             FILENAME=$(basename "$(dirname "$FILE")")
#             mv "$FILE" "$DIR/${NUMBER}.html"
#             echo "Moved: $FILE -> $DIR/${NUMBER}.html"
#         fi
#     fi
# done
dir_structure="/Users/hugohudson/Downloads/NeuroElectro-main-2/data/ephys/1.html/1/data/index.html"

for subdir in "$DIR"/*; do
    NUMBER=$(basename "$subdir" .html)
    echo "Dir $DIR"
    if [ -d "$subdir" ]; then
        FILE="${subdir}/${NUMBER}/data/index.html"
        if [ -f "$FILE" ]; then
            grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/data_table/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt
            grep -Eo "https://web.archive.org/web/[0-9]{14}/https://neuroelectro.org/article/[0-9]+/" "$FILE" | sort -u >> ephys_urls.txt
        fi
        echo "Processed: $FILE"
    fi
done

